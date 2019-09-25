//
//  TripRepresentation.swift
//  KidsFly
//
//  Created by Andrew Ruiz on 9/24/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

struct TripRepresentation: Codable {
    
    var tripid: Int32
    var date: String
    var passengercount: Int32
    var luggagetype: String
}
