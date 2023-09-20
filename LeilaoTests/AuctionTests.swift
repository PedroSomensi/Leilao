//
//  AuctionTests.swift
//  LeilaoTests
//
//  Created by Pedro Somensi on 11/08/23.
//

import XCTest
@testable import Leilao

final class AuctionTests: XCTestCase {

    private var sut: Auction!
    
    override func setUp() {
        super.setUp()
        sut = Auction(description: "Playstation 5", image: nil)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func test_should_start_with_zero_bids() {
        XCTAssertEqual(0, sut.bids.count)
    }
    
    func test_should_recived_one_bid() {
        sut.proposal(bid: Bid(user: User(id: 0, name: "Lucas"), value: 200.0))
        
        XCTAssertEqual(1, sut.bids.count)
        XCTAssertEqual(200.0, sut.bids.first?.value)
    }
    
    func test_should_recived_some_bids() {
        sut.proposal(bid: Bid(user: User(id: 0, name: "Lucas"), value: 200.0))
        sut.proposal(bid: Bid(user: User(id: 0, name: "Maria"), value: 300.0))
        
        XCTAssertEqual(2, sut.bids.count)
        XCTAssertEqual(200.0, sut.bids.first?.value)
        XCTAssertEqual(300.0, sut.bids[1].value)
    }
    
    func test_should_ignore_2_bids_consecutive_bids_from_the_same_user() {
        let maria = User(id: 1, name: "Maria")
        
        sut.proposal(bid: Bid(user: maria, value: 200.0))
        sut.proposal(bid: Bid(user: maria, value: 300.0))
        
        XCTAssertEqual(1, sut.bids.count)
        XCTAssertEqual(200.0, sut.bids.first?.value)
    }
     
    func test_should_ignore_more_than_5_bids_from_the_same_user() {
        let jose = User(id: 1, name: "José")
        let maria = User(id: 1, name: "Maria")
        
        sut.proposal(bid: Bid(user: maria, value: 200.0))
        sut.proposal(bid: Bid(user: jose, value: 300.0))
        
        sut.proposal(bid: Bid(user: maria, value: 400.0))
        sut.proposal(bid: Bid(user: jose, value: 500.0))
        
        sut.proposal(bid: Bid(user: maria, value: 600.0))
        sut.proposal(bid: Bid(user: jose, value: 700.0))
        
        sut.proposal(bid: Bid(user: maria, value: 800.0))
        sut.proposal(bid: Bid(user: jose, value: 900.0))
        
        sut.proposal(bid: Bid(user: maria, value: 1000.0))
        sut.proposal(bid: Bid(user: jose, value: 1100.0))
        
        sut.proposal(bid: Bid(user: maria, value: 1200.0))
        sut.proposal(bid: Bid(user: jose, value: 1300.0))
        
        XCTAssertEqual(10, sut.bids.count)
        
        XCTAssertEqual(1100.0, sut.bids.last?.value)
    }
    
}
