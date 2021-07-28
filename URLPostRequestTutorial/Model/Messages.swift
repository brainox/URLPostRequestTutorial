//
//  Messages.swift
//  URLPostRequestTutorial
//
//  Created by Decagon on 27/07/2021.
//

import Foundation

final class Message: Codable {
    var id: Int?
    var message: String
    
    init(message: String) {
        self.message = message
    }
}
