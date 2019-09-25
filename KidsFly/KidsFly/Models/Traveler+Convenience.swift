//
//  Traveler+Convenience.swift
//  KidsFly
//
//  Created by Alex Shillingford on 9/24/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation
import CoreData

extension Traveler {
    convenience init(parentid: Int32, email: String, name: String, address: String, airport: String, trips: [Trip], context: NSManagedObjectContext) {
        self.init(context: context)
        
        self.parentid = parentid
        self.email = email
        self.name = name
        self.address = address
        self.airport = airport
        self.trips = NSOrderedSet(array: trips)
    }
}
