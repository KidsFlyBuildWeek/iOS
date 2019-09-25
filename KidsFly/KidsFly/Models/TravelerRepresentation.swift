//
//  TravelerRepresentation.swift
//  KidsFly
//
//  Created by Alex Shillingford on 9/24/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

struct TravelerRepresentation: Codable {
    var parentid: Int
    var email: String
    var name: String
    var address: String
    var airport: String
    var trips: [TripRepresentation]
}
