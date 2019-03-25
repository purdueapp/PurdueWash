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
    let machineData = ["Dryer 001", "Dryer 002", "Dryer 003"]
    
    
    @IBOutlet weak var machineTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        machineTable.dataSource = self
        machineTable.delegate = self
        
        //laundryRoomTable.estimatedRowHeight = 150
        //laundryRoomTable.rowHeight = UITableView.automaticDimension + 16
        
        
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MachineCell") as! MachineTableViewCell
        cell.machineNameLabel.text = machineData[indexPath.row]
        
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
