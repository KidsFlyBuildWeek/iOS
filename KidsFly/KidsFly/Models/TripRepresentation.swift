//
//  TripRepresentation.swift
//  KidsFly
//
//  Created by Andrew Ruiz on 9/24/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

// MARK: - Trip
struct TripRepresentation: Codable {
    let tripid: Int?
    let date: String
    let passengercount, childcount: Int
    let airport, luggagetype: String
    let staffUser: String?
}

