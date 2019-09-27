//
//  HomeTripsTableViewCell.swift
//  KidsFly
//
//  Created by Alex Shillingford on 9/26/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class HomeTripsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var flightName: UILabel!
    @IBOutlet weak var fromCityLabel: UILabel!
    @IBOutlet weak var estimatedTimeOfArrival: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var flightConnectionName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    @IBAction func seeInfoButtonTapped(_ sender: Any) {
    }
    
}
