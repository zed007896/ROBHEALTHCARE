//
//  networkmanger.swift
//  ROBHEALTHCARE
//
//  Created by User on 5/13/25.
//

import Foundation
//
//  NetworkManager.swift
//  ROBHEALTHCARE
//


class NetworkManager {
      static let shared = NetworkManager()
     let baseURL = "http://51.15.250.187:8006/api"
    
    func login(usr: String, pwd: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        let endpoint = "\(baseURL)/method/login"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let loginData = LoginRequest(usr: usr, pwd: pwd)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(loginData)
        } catch {
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let loginResponse = try decoder.decode(LoginResponse.self, from: data)
                completion(.success(loginResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
}
