//
//  ViewController.swift
//  Find Couple
//
//  Created by Madik on 11.01.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var ButtonCollection: [UIButton]!
    @IBOutlet private weak var countLabel: UILabel!
    
   private lazy var game = FindCoupleGame(numOfPairsCard: numOfPairsCard)
    
    var numOfPairsCard: Int {
        return  (ButtonCollection.count + 1 ) / 2
    }
    
   private(set) var count = 0 {
        didSet{
            countLabel.text = "Touches: \(count)"
        }
    }
 
    private var emojiCollection = ["😍", "😑", "☠️", "🥺", "😤", "😶‍🌫️", "🤭", "😏", "🥵", "😎", "🤡", "🤢", "😫", "😜"]
    
   private var emojiDictionary = [Int:String] ()
    
    
   private func emojiIdentifier(for card : Card ) -> String{
        if emojiDictionary[card.id] == nil {
            emojiDictionary[card.id] = emojiCollection.remove(at: emojiCollection.count.arc4randomIndex)
            count += 1
        }
        return emojiDictionary[card.id] ?? "?"
    }
    
   private func updateViewFromModel () {
        
        for index in ButtonCollection.indices{
            let button = ButtonCollection[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle( emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle( " ", for: .normal)
                button.backgroundColor = card.isMatched ? .white : .systemYellow
    
            }
        }
        
    }

@IBAction private func ButtonDidTap(_ sender: UIButton) {
    if let buttonIndex = ButtonCollection.firstIndex(of: sender) {
        game.chooseCard(at: buttonIndex)
        updateViewFromModel()
    }
    
    }
    
}

extension Int {
    var arc4randomIndex: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
