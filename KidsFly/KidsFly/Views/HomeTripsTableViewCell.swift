//
//  HomeTripsTableViewCell.swift
//  KidsFly
//
//  Created by Alex Shillingford on 9/26/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class HomeTripsTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets & Properties
    @IBOutlet weak var airportLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var passengerCountLabel: UILabel!
    @IBOutlet weak var luggageTypeLabel: UILabel!
    @IBOutlet weak var flightConnectionName: UILabel!
    
    var trip: Trip? {
        didSet {
            updateViews()
        }
    }
    // MARK: - System Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: - IBActions and Methods
    @IBAction func seeInfoButtonTapped(_ sender: Any) {
    }
    
    func updateViews() {
        guard let trip = trip else { return }
        airportLabel.text = trip.airport
        dateLabel.text = trip.date
        passengerCountLabel.text = String(trip.passengercount)
        luggageTypeLabel.text = trip.luggagetype
        flightConnectionName.text = trip.staff?.name ?? "TBD"
    }
    
}
