//
//  AuctionnerTests.swift
//  LeilaoTests
//
//  Created by Pedro Somensi on 19/09/23.
//

import XCTest

@testable import Leilao

final class AuctionnerTests: XCTestCase {

    private let joao = User(id: 0, name: "João")
    private let jose = User(id: 1, name: "José")
    private let maria = User(id: 2, name: "Maria")
    
    private var auction: Auction!
    
    private let sut = Auctionner()
    
    override func setUp() {
        super.setUp()
        
        auction = Auction(
            description: "Macbook pro 16 - M1",
            image: nil
        )
    }
    
    override func tearDown() {
        super.tearDown()
        auction = nil
    }
    
    func test_should_understand_bids_in_ascending_order() {
        auction.proposal(bid: Bid(user: joao, value: 250.0))
        auction.proposal(bid: Bid(user: jose, value: 300.0))
        auction.proposal(bid: Bid(user: maria, value: 400.0))
        
        try? sut.evaluate(auction)
        
        XCTAssertEqual(250.0, sut.smallestBid)
        XCTAssertEqual(400.0, sut.hightestBid)
    }
    
    func test_should_understand_bids_decresing_order() {
        auction.proposal(bid: Bid(user: joao, value: 400.0))
        auction.proposal(bid: Bid(user: jose, value: 300.0))
        auction.proposal(bid: Bid(user: maria, value: 250.0))
        
        try? sut.evaluate(auction)
        
        XCTAssertEqual(250.0, sut.smallestBid)
        XCTAssertEqual(400.0, sut.hightestBid)
    }
    
    func test_should_understand_auction_with_only_bid() {
        auction.proposal(bid: Bid(user: joao, value: 1000.0))
        
        try? sut.evaluate(auction)
        
        XCTAssertEqual(1000.0, sut.smallestBid)
        XCTAssertEqual(1000.0, sut.hightestBid)
    }
    
    func test_should_find_3_hightestbids() {
        /* using data builder */
        auction = AuctionCreator()
            .to(description: "Play 5")
            .bid(joao, value: 300.0)
            .bid(maria, value: 400.0)
            .bid(joao, value: 600.0)
            .bid(maria, value: 650.0)
            .build()
        
        try? sut.evaluate(auction)
        
        let highestBids = sut.hightestBids
        
        XCTAssertEqual(3, highestBids.count)
        
        XCTAssertEqual(650.0, highestBids[0].value)
        XCTAssertEqual(600.0, highestBids[1].value)
        XCTAssertEqual(400.0, highestBids[2].value)
    }
    
    func test_should_ignore_auction_without_bid() {
        /* using data builder */
        auction = AuctionCreator()
            .to(description: "Play 4")
            .build()
        
        XCTAssertThrowsError(try sut.evaluate(auction), "It isnt possible to evaluate an auction without bids")
    }
    
}
