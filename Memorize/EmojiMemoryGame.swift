//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by macbook on 23/01/2021.
//

import SwiftUI

class EmojiMemoryGame {
    // private(set) - only EmojiMemoryGame can modify the model, but others can see it
    // private - no access from outside
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    // static creates function on a type, not on instance
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃","🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        } // closure (Int) -> String
    }
    // MARK: - Access to the Model
    
    // one line functions that return something, do not need "return" keyword
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
