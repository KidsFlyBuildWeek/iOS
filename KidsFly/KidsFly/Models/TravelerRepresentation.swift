//
//  TravelerRepresentation.swift
//  KidsFly
//
//  Created by Alex Shillingford on 9/24/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

// MARK: - TravelerElement
struct TravelerRepresentation: Codable {
    let parentid: Int?
    let username, password, phone, email: String
    let name, address, airport: String
    let status: String?
    let trips: [TripRepresentation?]
}
