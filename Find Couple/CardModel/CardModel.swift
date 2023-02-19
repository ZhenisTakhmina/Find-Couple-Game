//
//  CardModel.swift
//  Find Couple
//
//  Created by Madik on 12.01.2023.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var id : Int
    
   private static var numberID = 0
    
   private static func generatorID () -> Int{
        numberID += 1
        return numberID
    }
    
    init() {
        self.id = Card.generatorID()
    }
     
}
