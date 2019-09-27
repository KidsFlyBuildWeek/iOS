//
//  TravelerController.swift
//  KidsFly
//
//  Created by Alex Shillingford on 9/26/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import Foundation

// MARK: - Enums
enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

enum NetworkError: Error {
    case encodingError
    case responseError
    case otherError
    case noData
    case noDecode
}


// MARK: - TravelController Class

class TravelController {
    
    // MARK: - Properties
    let baseURL = URL(string: "https://kidsflybackend.herokuapp.com")!
    
    var bearer: Bearer?
    
    // The Error? in the completion closure lets us return an error to the view controller for further error handling.
    
    // MARK: - createNewTraveler
       func createNewTraveler(with user: TravelerRepresentation, completion: @escaping (NetworkError?) -> Void) {
        
        
        let signUpURL = baseURL
                .appendingPathComponent("parents")
                .appendingPathComponent("new")
        
        // Explains what headerfield values are.
        /* https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#Field_values */
        var request = URLRequest(url: signUpURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        
        do {
            // Convert the User object into JSON data.
            let userData = try encoder.encode(user)
            
            // Attach the user JSON to the URLRequest
            request.httpBody = userData
        } catch {
            NSLog("Error encoding user: \(error)")
            completion(.encodingError)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(.responseError)
                return
            }
            
            if let error = error {
                NSLog("Error creating user on server: \(error)")
                completion(.otherError)
                return
            }
            completion(nil)
            }.resume()
    }
    
    // MARK: - login Method
    func login(with user: TravelerRepresentation, completion: @escaping (NetworkError?) -> Void) {
        
        // Set up the URL
        
        let loginURL = baseURL
            .appendingPathComponent("users")
            .appendingPathComponent("login")
        
        // Set up a request
        
        var request = URLRequest(url: loginURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        
        do {
            request.httpBody = try encoder.encode(user)
        } catch {
            NSLog("Error encoding user object: \(error)")
            completion(.encodingError)
            return
        }
        
        // Perform the request
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Handle errors
            
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(.responseError)
                return
            }
            
            if let error = error {
                NSLog("Error logging in: \(error)")
                completion(.otherError)
                return
            }
            
            // (optionally) handle the data returned
            
            guard let data = data else {
                completion(.noData)
                return
            }
            
            do {
                let bearer = try JSONDecoder().decode(Bearer.self, from: data)
                self.bearer = bearer
            } catch {
                completion(.noDecode)
                return
            }
            completion(nil)
        }.resume()
    }
    
    // MARK: - Post Trip Method
    func postTrip(trip: Trip, completion: @escaping () -> Void = {  }) {
        let requestURL = baseURL.appendingPathComponent("trips")
                                .appendingPathComponent("new")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.post.rawValue
        
        guard let tripRepresentation = trip.tripRepresentation else {
            NSLog("Trip Representation is nil on line \(#line) in \(#file)")
            completion()
            return
        }
        
        do {
            request.httpBody = try JSONEncoder().encode(tripRepresentation)
        } catch {
            NSLog("Error encoding trip representation on line \(#line) in \(#file): \(error)")
            completion()
            return
        }
        
        URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let error = error {
                NSLog("Error POSTing trip on line \(#line) in \(#file): \(error)")
                completion()
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    NSLog("Response status code returned code \(response.statusCode)")
                    completion()
                    return
                }
            }
            
            completion()
        }.resume()
    }
    
    
}
