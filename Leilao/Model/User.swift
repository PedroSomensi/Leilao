//
//  User.swift
//  Leilao
//
//  Created by Pedro Somensi on 11/08/23.
//

import Foundation

struct User {
    
    let id: Int
    let name: String
    
}

extension User: Equatable {
    
    static func == (lhs: User, rhs: User) -> Bool {
        if lhs.id != rhs.id || lhs.name != rhs.name {
            return false
        }
        return true
    }
    
}
