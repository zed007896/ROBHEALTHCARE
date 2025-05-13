//
//  loginresponse.swift
//  ROBHEALTHCARE
//
//  Created by User on 5/13/25.
//

import Foundation
struct LoginResponse: Codable {
    let message: String     // Example: "Logged in"
    let home_page: String  // Example: "/dashboard"
    let full_name: String  // Example: "Dr. Smith"
}
