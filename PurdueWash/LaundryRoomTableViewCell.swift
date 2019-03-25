//
//  LaundryRoomTableViewCell.swift
//  PurdueWash
//
//  Created by Tobi Ola on 3/18/19.
//  Copyright © 2019 Tobi Ola. All rights reserved.
//

import UIKit

class LaundryRoomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var laundryRoomNameLabel: UILabel!
    
    @IBOutlet weak var washerCountLabel: UILabel!
    @IBOutlet weak var washerProgressBar: UIProgressView!
    
    @IBOutlet weak var dryerCountLabel: UILabel!
    @IBOutlet weak var dryerProgressBar: UIProgressView!
    
    @IBOutlet weak var laundryRoomImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
