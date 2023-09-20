//
//  Auction.swift
//  Leilao
//
//  Created by Pedro Somensi on 11/08/23.
//

import Foundation

final class Auction {
    
    let description: String
    let image: String?
    var bids = [Bid]()
    
    init(
        description: String,
        image: String?,
        bids: [Bid] = []
    ) {
        self.description = description
        self.image = image
        self.bids = bids
    }
    
    func proposal(bid: Bid) {
        
        if bids.count == 0 || canBid(bid.user) {
            bids.append(bid)
        }
        
    }
    
    private func lastBidProprosed(_ bids: [Bid]) -> Bid {
        return bids[bids.count - 1]
    }
    
    private func canBid(_ user: User) -> Bool {
        return lastBidProprosed(bids).user != user  && amountBidsOf(user) < 5
    }
    
    private func amountBidsOf(_ user: User) -> Int {
        var total = 0
        
        for currentBid in bids {
            if currentBid.user == user {
                total += 1
            }
        }
        
        return total
    }
    
}
