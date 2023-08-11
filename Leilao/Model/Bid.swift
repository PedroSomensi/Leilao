//
//  Bid.swift
//  Leilao
//
//  Created by Pedro Somensi on 11/08/23.
//

import Foundation

struct Bid {
    
    let user: User
    let value: Double
    
    init(user: User, value: Double) {
        self.user = user
        self.value = value
    }
    
}
