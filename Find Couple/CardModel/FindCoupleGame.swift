//
//  FindCoupleGame.swift
//  Find Couple
//
//  Created by Madik on 12.01.2023.
//

import Foundation

class FindCoupleGame {
    
    private(set) var cards = [Card]()

    private var indexOfOneAndOnlyFaceUpCard : Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    if foundIndex == nil{
                        foundIndex = index
                    } else{
                        foundIndex = nil
                    }
                }
            }
           return foundIndex
        }
        set{
            for index in cards.indices {
                cards[index].isFaceUp = (newValue == index)
            }
            
        }
    }
    
    
    func chooseCard (at index : Int) {
        
        if !cards[index].isMatched {
            
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard , matchingIndex != index {
                
                if cards[matchingIndex].id == cards[index].id {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            
            }
            
        }
    }
    
    init (numOfPairsCard : Int) {
        assert(numOfPairsCard > 0, "find couple game.init \(numOfPairsCard) must have at least one pair of cards")
        for _ in 1...numOfPairsCard{
            let card = Card()
            cards += [card,card]
        }
        
        cards.shuffle()
        
    }
    
}
