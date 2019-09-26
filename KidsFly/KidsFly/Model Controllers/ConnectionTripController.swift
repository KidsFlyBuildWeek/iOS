//
//  ConnectionTripController.swift
//  KidsFly
//
//  Created by Alex Shillingford on 9/25/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation
import CoreData

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

class ConnectionTripController {
    let baseURL = URL(string: "https://kidsflybackend.herokuapp.com")!
    
    
}
