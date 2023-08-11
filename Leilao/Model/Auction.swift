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
    var bids: [Bid] = []
    
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
        bids.append(bid)
    }
    
}
