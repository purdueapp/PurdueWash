//
//  HomeViewController.swift
//  PurdueWash
//
//  Created by Tobi Ola on 3/18/19.
//  Copyright © 2019 Tobi Ola. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let laundryData = ["Wiley", "Hawkins", "Hilltop"]
    
    @IBOutlet weak var laundryRoomTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        laundryRoomTable.dataSource = self
        laundryRoomTable.delegate = self
        
        laundryRoomTable.rowHeight = 150
        // laundryRoomTable.rowHeight = UITableView.automaticDimension

        
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LaundryRoomCell") as! LaundryRoomTableViewCell
        cell.laundryRoomNameLabel.text = laundryData[indexPath.row] + " Laundry Room"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return laundryData.count
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
