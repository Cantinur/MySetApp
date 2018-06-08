//
//  Game.swift
//  MySetApp
//
//  Created by Henrik Anthony Odden Sandberg on 6/7/18.
//  Copyright © 2018 Henrik Anthony Odden Sandberg. All rights reserved.
//

import Foundation

class Game{
    var deck =  [Card]()
    
    init() {
        self.newDeck()
    }
    
    func newDeck(){
        var orderdDeck = [Card]()
        for color in 0...Card.Color.allCases.count-1{
            for symboles in 0...Card.Symbol.allCases.count-1{
                for shading in 0...Card.Shading.allCases.count-1{
                    for number in 0...Card.Number.allCases.count-1{
                        orderdDeck.append(Card(color: color, symbol: symboles, number: number, shading: shading))
                    }
                }
            }
        }
        for _ in orderdDeck{
            deck.append(orderdDeck.remove(at: orderdDeck.count.arc4Randum))
        }
    }
    
    func checkForMatch(card1: Card, card2: Card, card3: Card) -> Bool{
        return card1 == card2 && card1 == card3 && card2 == card3
    }
}

extension Int{
    var arc4Randum: Int{
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
