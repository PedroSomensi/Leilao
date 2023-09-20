//
//  Auctioneer.swift
//  Leilao
//
//  Created by Pedro Somensi on 11/08/23.
//

import Foundation

enum AuctionnerError: Error {
    case withoutBid(String)
}

final class Auctionner {
    
    private(set) var hightestBid = Double.leastNonzeroMagnitude
    private(set) var smallestBid = Double.greatestFiniteMagnitude
    
    private(set) var hightestBids = [Bid]()
    
    func evaluate(_ auction: Auction) throws {
        
        if auction.bids.isEmpty {
            throw AuctionnerError.withoutBid("It isnt possible to evaluate an auction without bids")
        }
        
        for bid in auction.bids {
            if bid.value > hightestBid {
                hightestBid = bid.value
            }
            if bid.value < smallestBid {
                smallestBid = bid.value
            }
        }
        
        getHightestBidsOf(auction)
    }
    
    private func getHightestBidsOf(_ auction: Auction) {
        
        let bids = auction.bids
        
        hightestBids = bids.sorted(by: { bids1, bids2 in
            return bids1.value > bids2.value
        })
        
        let _hightestBids = hightestBids.prefix(3)
        hightestBids = Array(_hightestBids)
    }
    
}
