//
//  ViewController.swift
//  Leilao
//
//  Created by Pedro Somensi on 11/08/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let joao = User(
            id: 0,
            name: "João"
        )
        let jose = User(
            id: 1,
            name: "José"
        )
        let maria = User(
            id: 2,
            name: "Maria"
        )
        
        let auction = Auction(
            description: "Macbook pro 16 - M1",
            image: nil
        )
        
        auction.proposal(bid: Bid(user: joao, value: 300.0))
        auction.proposal(bid: Bid(user: jose, value: 400.0))
        auction.proposal(bid: Bid(user: maria, value: 200.0))
        
        let auctioneer = Auctionner()
        auctioneer.evaluate(auction)
        
        print(auctioneer.hightestBid)
        print(auctioneer.smallestBid)
    }


}

