//
//  AuctionCreator.swift
//  Leilao
//
//  Created by Pedro Somensi on 19/09/23.
//

import Foundation

final class AuctionCreator {
    
    private var auction: Auction?
    
    func to(description: String, image: String? = nil) -> Self {
        auction = Auction(description: description, image: image)
        return self
    }
        
    func bid(_ user: User, value: Double) -> Self {
        if let auction = auction {
            auction.proposal(bid: Bid(user: user, value: value))
        }
        return self
    }
    
    func build() -> Auction? {
        return auction
    }
}
