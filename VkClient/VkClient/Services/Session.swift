//
//  Session.swift
//  VkClient
//
//  Created by Ilya Belyakov on 17.04.2021.
//

import Foundation

class Session {
    
    private init() {}
    
    static let shared = Session()
    var token: String?
    var userId: String?
}
