//
//  Auctioneer.swift
//  Leilao
//
//  Created by Pedro Somensi on 11/08/23.
//

import Foundation

final class Auctionner {
    
    private(set) var hightestBid = Double.leastNonzeroMagnitude
    private(set) var smallestBid = Double.greatestFiniteMagnitude
    
    func evaluate(_ auction: Auction) {
        
        for bid in auction.bids {
            if bid.value > hightestBid {
                hightestBid = bid.value
            } else if bid.value < smallestBid {
                smallestBid = bid.value
            }
        }
        
    }
    
}
