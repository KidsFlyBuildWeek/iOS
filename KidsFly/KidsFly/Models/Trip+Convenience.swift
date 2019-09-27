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
            let luggagetype = luggagetype,
            let airport = airport,
            let staffUser = staff else { return nil }
       
        
        return TripRepresentation(tripid: Int(tripid), date: date, passengercount: Int(passengercount), childcount: Int(passengercount), airport: airport, luggagetype: luggagetype, staffUser: staffUser.name)
    }
    
    convenience init(tripid: Int32, date: String, passengercount: Int32, childcount: Int32, airport: String, luggagetype: String, staff: Staff?, context: NSManagedObjectContext) {
        self.init(context: context)
        
        self.tripid = tripid
        self.date = date
        self.passengercount = passengercount
        self.luggagetype = luggagetype
        self.staff = staff
    }
    
    @discardableResult convenience init?(tripRepresentation: TripRepresentation, context: NSManagedObjectContext) {
        self.init(tripid: Int32(tripRepresentation.tripid.hashValue), date: tripRepresentation.date, passengercount: Int32(tripRepresentation.passengercount.hashValue), childcount: Int32(tripRepresentation.childcount.hashValue), airport: tripRepresentation.airport, luggagetype: tripRepresentation.luggagetype, staff: nil, context: context)
    }
}
