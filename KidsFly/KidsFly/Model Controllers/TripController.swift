//
//  FlightController.swift
//  KidsFly
//
//  Created by Alex Shillingford on 9/23/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

class ConnectionTripController {
    let baseURL = URL(string: "https://kidsflymockdata.firebaseio.com/")
    
    func put(trip: Trip, completion: @escaping () -> Void = { }) {
        let requestURL = baseURL?.appendingPathExtension("json")
    }
}
