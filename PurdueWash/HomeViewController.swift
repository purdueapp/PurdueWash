//
//  HomeViewController.swift
//  PurdueWash
//
//  Created by Tobi Ola on 3/18/19.
//  Copyright © 2019 Tobi Ola. All rights reserved.
//

import UIKit

import Alamofire
import AlamofireImage

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let laundryData = ["Wiley", "Hawkins", "Hilltop", "Earhart", "Owen", "Cary", "Harrison", "Hillenbrand", "McCutcheon", "Meredith", "Shreve", "Tarkington", "Third Street", "Windsor"]
    
    @IBOutlet weak var laundryRoomTable: UITableView!
    private let refreshControl = UIRefreshControl()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        laundryRoomTable.dataSource = self
        laundryRoomTable.delegate = self
        
        //laundryRoomTable.estimatedRowHeight = 150
        //laundryRoomTable.rowHeight = UITableView.automaticDimension + 16
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            laundryRoomTable.refreshControl = refreshControl
        } else {
            laundryRoomTable.addSubview(refreshControl)
        }

        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Laundry Data ...")
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)

        
    }
    
    @objc private func refreshWeatherData(_ sender: Any) {
        // Fetch Weather Data
        fetchWeatherData()
    }
    
    private func fetchWeatherData() {
        print("yeet")
        self.refreshControl.endRefreshing()
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LaundryRoomCell") as! LaundryRoomTableViewCell
        cell.laundryRoomNameLabel.text = laundryData[indexPath.row] + " Laundry Room"
        
        let imageName = laundryData[indexPath.row].lowercased().components(separatedBy: " ")[0]
        
        cell.laundryRoomImage.image = UIImage(named:imageName)
        cell.laundryRoomImage.layer.cornerRadius = cell.laundryRoomImage.frame.size.width / 8
        cell.laundryRoomImage.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return laundryData.count
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let cell = sender as! LaundryRoomTableViewCell
        let indexPath = laundryRoomTable.indexPath(for: cell)!
        let detailsViewController = segue.destination as! LaundryRoomViewController
        let title = laundryData[indexPath.row].components(separatedBy: " ")[0]
        
        detailsViewController.navigationTitle.title = title
        
        
        laundryRoomTable.deselectRow(at: indexPath, animated: true)
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
