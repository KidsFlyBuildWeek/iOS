//
//  StaffRepresentation.swift
//  KidsFly
//
//  Created by Alex Shillingford on 9/26/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

struct StaffRepresentation: Codable {
    struct StaffRepresentation: Codable {
        let staffid: Int
        let username, password, phone, email: String?
        let name, status, birthdate, location: String?
        let trips: [TripRepresentation]
    }
}
