//
//  LaundryRoomViewController.swift
//  PurdueWash
//
//  Created by Tobi Ola on 3/25/19.
//  Copyright © 2019 Tobi Ola. All rights reserved.
//

import UIKit

class LaundryRoomViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var navigationTitle: UINavigationItem!
    var machines = [Machine]()
    
    private let refreshControl = UIRefreshControl()
    @IBOutlet weak var machineTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        machineTable.dataSource = self
        machineTable.delegate = self
        
        machineTable.estimatedRowHeight = 150
        machineTable.rowHeight = 64
        
        if #available(iOS 10.0, *) {
            machineTable.refreshControl = refreshControl
        } else {
            machineTable.addSubview(refreshControl)
        }
        
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Laundry Data ...")
        refreshControl.addTarget(self, action: #selector(refreshLaundryData(_:)), for: .valueChanged)
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
                var laundryRooms = [LaundryRoom]()
                for laundryRoomJSON in json as! [[String: Any]] {
                    let laundryRoom = LaundryRoom(json: laundryRoomJSON)
                    laundryRooms.append(laundryRoom)
                    if laundryRoom.name.contains(self.navigationTitle.title!) {
                        self.machines = laundryRoom.machines
                    }
                }
            } catch let jsonErr {
                print (jsonErr)
            }
            
            DispatchQueue.main.async {
                self.machineTable.reloadData()
                self.refreshControl.endRefreshing()
            }
        }.resume()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MachineCell") as! MachineTableViewCell
        let machine = machines[indexPath.row]

        cell.machineNameLabel.text = machine.name
        cell.statusLabel.text = machine.status
        
        if machine.status == "Out of order" {
            cell.statusLabel.textColor = UIColor.darkGray
        } else if machine.status == "In use" {
            cell.statusLabel.textColor = UIColor(red: 1, green: 0.2, blue: 0.2, alpha: 1)
            cell.statusLabel.text = "\(machine.timeRemaining)"
        } else if machine.status == "End of cycle" {
            cell.statusLabel.textColor = UIColor.orange
        } else if machine.status == "Available" {
            cell.statusLabel.textColor = UIColor(red: 0, green: 0.7, blue: 0.1, alpha: 1)
        } else if machine.status == "Not online" {
            cell.statusLabel.textColor = UIColor.darkGray
        } else if machine.status == "Payment in progress" {
            cell.statusLabel.textColor = UIColor.orange
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return machines.count
    }
}
