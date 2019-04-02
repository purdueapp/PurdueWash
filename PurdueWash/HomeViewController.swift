//
//  HomeViewController.swift
//  PurdueWash
//
//  Created by Tobi Ola on 3/18/19.
//  Copyright © 2019 Tobi Ola. All rights reserved.
//

import UIKit

struct LaundryRoom {
    let name: String
    let availableWashers: String
    let totalWashers: String
    let availableDryers: String
    let totalDryers: String
    var machines: [Machine]
    
    init(json: [String: Any]) {
        name = json["Name"] as? String ?? "Name"
        availableWashers = json["AvailableWashers"] as? String ?? "0"
        totalWashers = json["TotalWashers"] as? String ?? "0"
        availableDryers = json["AvailableDryers"] as? String ?? "0"
        totalDryers = json["TotalDryers"] as? String ?? "0"
        machines = [Machine]()
        for machine in json["Machines"] as? [[String: Any]] ?? [[:]] {
            machines.append(Machine(json: machine))
        }
    }
}

struct Machine {
    let name: String
    let status: String
    let timeRemaining: String
    
    init(json: [String: Any]) {
        name = json["Name"] as? String ?? "name"
        status = json["Status"] as? String ?? "status"
        timeRemaining = json["TimeRemaining"] as? String ?? "time remaining"
    }
}

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchControllerDelegate, UISearchResultsUpdating{
    
    var laundryRooms = [LaundryRoom]()
    var filteredLaundryRooms = [LaundryRoom]()
    @IBOutlet weak var laundryRoomTable: UITableView!
    private let refreshControl = UIRefreshControl()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchLaundryData()
        
        laundryRoomTable.dataSource = self
        laundryRoomTable.delegate = self
        
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        
        laundryRoomTable.estimatedRowHeight = 140
        laundryRoomTable.rowHeight = 140
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            laundryRoomTable.refreshControl = refreshControl
        } else {
            laundryRoomTable.addSubview(refreshControl)
        }
        
        refreshControl.tintColor = UIColor.white
        
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
        } else {
            laundryRoomTable.tableHeaderView = searchController.searchBar
        }
        
        searchController.searchBar.barTintColor = UIColor.white
        let textField = searchController.searchBar.value(forKey: "searchField") as! UITextField
        textField.textColor = UIColor.white
        // refreshControl.attributedTitle = NSAttributedString(string: "Fetching Laundry Data ...")
        refreshControl.addTarget(self, action: #selector(refreshLaundryData(_:)), for: .valueChanged)
        
    }
    

    func filterContentForSearch(searchString: String) {
        self.filteredLaundryRooms = [LaundryRoom]()
        for laundryRoom in self.laundryRooms {
            if laundryRoom.name.lowercased().contains(searchString.lowercased()) {
                self.filteredLaundryRooms.append(laundryRoom)
            }
        }
        if self.filteredLaundryRooms.count == 0 {
            self.filteredLaundryRooms = self.laundryRooms
        }
        self.laundryRoomTable.reloadData()
    }

    func updateSearchResults(for searchController: UISearchController) {
        let query = searchController.searchBar.text
        if query != nil && query != "" {
            filterContentForSearch(searchString: query!)
        }
    }
    
    @objc private func refreshLaundryData(_ sender: Any) {
        fetchLaundryData()
    }
    
    private func fetchLaundryData() {
        guard let url = URL(string: "http://data.cs.purdue.edu:8421") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // check err
            // check response for 200
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                self.laundryRooms = [LaundryRoom]()
                for laundryRoom in json as! [[String: Any]] {
                    self.laundryRooms.append(LaundryRoom(json: laundryRoom))
                }
            } catch let jsonErr {
                print (jsonErr)
            }
            
            DispatchQueue.main.async {
                self.laundryRoomTable.reloadData()
                self.refreshControl.endRefreshing()
            }
        }.resume()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func shouldFilter(searchController: UISearchController) -> Bool {
        let filter = self.searchController.isActive && self.searchController.searchBar.text != nil && self.searchController.searchBar.text != ""
        return filter
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LaundryRoomCell") as! LaundryRoomTableViewCell
        var laundryRoom: LaundryRoom
        if shouldFilter(searchController: self.searchController) {
            laundryRoom = self.filteredLaundryRooms[indexPath.row]
        } else {
            laundryRoom = self.laundryRooms[indexPath.row]
        }
        let imageName = laundryRoom.name.lowercased().components(separatedBy: " ")[0]
        
        cell.laundryRoomNameLabel.text = laundryRoom.name
        
        cell.washerCountLabel.text = "\(laundryRoom.availableWashers) / \(laundryRoom.totalWashers)"
        cell.dryerCountLabel.text = "\(laundryRoom.availableDryers) / \(laundryRoom.totalDryers)"
        
        cell.washerProgressBar.progress = Float(laundryRoom.availableWashers)! / Float(laundryRoom.totalWashers)!
        cell.dryerProgressBar.progress = Float(laundryRoom.availableDryers)! / Float(laundryRoom.totalDryers)!

        cell.laundryRoomImage.image = UIImage(named:imageName)
        cell.laundryRoomImage.layer.cornerRadius = cell.laundryRoomImage.frame.size.width / 8
        cell.laundryRoomImage.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldFilter(searchController: self.searchController) {
            return self.filteredLaundryRooms.count
        } else {
            return self.laundryRooms.count
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! LaundryRoomTableViewCell
        let indexPath = laundryRoomTable.indexPath(for: cell)!
        let detailsViewController = segue.destination as! LaundryRoomViewController
        var laundryRoom: LaundryRoom
        
        if shouldFilter(searchController: self.searchController) {
            laundryRoom = self.filteredLaundryRooms[indexPath.row]
        } else {
            laundryRoom = self.laundryRooms[indexPath.row]
        }
        
        let words = laundryRoom.name.components(separatedBy: " ")
        var title = ""
        
        let offset = words[words.count - 1] == "Room" ? 2 : 1
        
        for word in words[0 ..< words.count - offset] {
            title += word + " "
        }
        
        detailsViewController.navigationTitle.title = title
        detailsViewController.machines = [Machine]()
        
        for machine in laundryRoom.machines {
            detailsViewController.machines.append(machine)
        }
    
        laundryRoomTable.deselectRow(at: indexPath, animated: true)
    }
}
