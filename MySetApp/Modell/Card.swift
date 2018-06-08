//
//  Card.swift
//  MySetApp
//
//  Created by Henrik Anthony Odden Sandberg on 6/7/18.
//  Copyright © 2018 Henrik Anthony Odden Sandberg. All rights reserved.
//

import UIKit

struct Card: Hashable {
    var isMatched = false
    private var color: Card.Color!
    private var symbol: Card.Symbol!
    private var number: Card.Number!
    private var shading: Card.Shading!
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.color == rhs.color || lhs.symbol == rhs.symbol || lhs.number == rhs.number || lhs.shading == rhs.shading
    }

    enum Color: CaseIterable { case green, red, purple }
    enum Symbol: String,CaseIterable{ case diamond = "▲", squiggle = "●", oval = "■" } 
    enum Shading: Int, CaseIterable { case solid = 1, striped = 2 , open = 3 }
    enum Number: Int, CaseIterable{ case one = 1, two = 2, three = 3}
    
    init(color:Int, symbol:Int, number:Int, shading: Int) {
        self.color = setColor(color)
        self.symbol = setSymbol(symbol)
        self.number = setNumber(number)
        self.shading = setShading(shading)
        print(self)
    }
    
    //MARK:- Accessing variables
    
    func getColor() -> UIColor{
        if let s = color{
            switch s {
            case .green:
                return UIColor.green
            case .red:
                return UIColor.red
            default:
                return UIColor.purple
            }
        }
        return UIColor.gray
    }
    
    func getNumber() -> Int {
        return number.rawValue 
    }
    
    func getSymbol() -> String {
        return symbol.rawValue
    }
    
    func getShading() -> Int {
        return shading.rawValue
    }
    
    //MARK:- Switchs that sets what perameters the cards should have
    private func setColor(_ number: Int) -> Card.Color{
        switch number {
        case 0:
            return Card.Color.green
        case 1:
            return Card.Color.purple
        default:
            return Card.Color.red
        }
    }
    
    private func setSymbol(_ number: Int) -> Card.Symbol{
        switch number {
        case 0:
            return Card.Symbol.diamond
        case 1:
            return Card.Symbol.squiggle
        default:
            return Card.Symbol.oval
        }
    }
    
    private func setNumber(_ number: Int) -> Card.Number{
        switch number {
        case 0:
            return Card.Number.one
        case 1:
            return Card.Number.two
        default:
            return Card.Number.three
        }
    }
    
    private func setShading(_ number: Int) -> Card.Shading{
        switch number {
        case 0:
            return Card.Shading.solid
        case 1:
            return Card.Shading.striped
        default:
            return Card.Shading.open
        }
    }
}
