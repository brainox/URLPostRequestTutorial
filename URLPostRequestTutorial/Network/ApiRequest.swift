//
//  ApiRequest.swift
//  URLPostRequestTutorial
//
//  Created by Decagon on 27/07/2021.
//

import Foundation

enum ApiError: Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
}

struct ApiRequest {
    let resourcesURL: URL
    
    init(endPoint: String) {
        let resourceString = "http://localhost:8080/api/\(endPoint)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourcesURL = resourceURL
    }
    
    func save(_ messageToSave: Message, completion: @escaping (Result<Message, ApiError>) -> Void) {
        
        do {
            var urlRequest = URLRequest(url: resourcesURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try! JSONEncoder().encode(messageToSave)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    completion(.failure(.responseProblem))
                    return
                }
                do {
                    let messageData = try JSONDecoder().decode(Message.self, from: jsonData)
                    completion(.success(messageData))
                } catch {
                    completion(.failure(.decodingProblem))
                }
                
            }
            dataTask.resume()
        } catch {
            completion(.failure(.encodingProblem))
        }
    }
}
