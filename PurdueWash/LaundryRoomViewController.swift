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
    let searchController = UISearchController(searchResultsController: nil)

    let machineData = ["Washer 01", "Washer 02", "Washer 03", "Washer 04", "Washer 05", "Washer 06", "Washer 07", "Washer 08", "Washer 09", "Washer 10", "Washer 11"]
    
    
    private let refreshControl = UIRefreshControl()

    @IBOutlet weak var machineTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        machineTable.dataSource = self
        machineTable.delegate = self
        
        machineTable.estimatedRowHeight = 150
        machineTable.rowHeight = 80
        
        if #available(iOS 10.0, *) {
            machineTable.refreshControl = refreshControl
        } else {
            machineTable.addSubview(refreshControl)
        }
        navigationItem.searchController = searchController
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MachineCell") as! MachineTableViewCell
        cell.machineNameLabel.text = machineData[indexPath.row]
        cell.statusLabel.text = "Out of Order"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return machineData.count
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
