//
//  ConnectionTripsTableViewCell.swift
//  KidsFly
//
//  Created by Alex Shillingford on 9/23/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class ConnectionTripsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var travelerName: UILabel!
    @IBOutlet weak var etaLabel: UILabel!
    @IBOutlet weak var numberOfBagsLabel: UILabel!
    @IBOutlet weak var numberOfKidsLabel: UIStackView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
