//
//  Trip+Convenience.swift
//  KidsFly
//
//  Created by Alex Shillingford on 9/24/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation
import CoreData

extension Trip {
    
    var tripRepresentation: TripRepresentation? {
        guard let date = date,
            let luggagetype = luggagetype else { return nil }
        
        return TripRepresentation(tripid: Int(tripid), date: date, passengercount: Int(passengercount), luggagetype: luggagetype)
    }
    
    convenience init(tripid: Int32, date: String, passengercount: Int32, luggagetype: String, context: NSManagedObjectContext) {
        self.init(context: context)
        
        self.tripid = tripid
        self.date = date
        self.passengercount = passengercount
        self.luggagetype = luggagetype
    }
}
