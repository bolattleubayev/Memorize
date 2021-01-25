//
//  MemoryGame.swift
//  Memorize
//
//  Created by macbook on 23/01/2021.
//

import Foundation

// CardContent - do not care type, generic type, can be anything String, Image, etc.

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    // structs are generally immutable, so we need mutating keyword to change it
    mutating func choose(_ card: Card){
        print("card chosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0 // TODO: bogus!
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
        cards.shuffle()
    }
    
    // Conforming to Identifiable protocol allows using ForEach() on array of Cards
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
