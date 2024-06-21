//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Saad Kashif on 1/7/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 12) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    //var objectWillChange: ObservableObjectPublisher
    
    @Published private var model = createMemoryGame()
    
    //@Published basically tells the system something changed
    //when the var changes.
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var score : Int {
        return model.score
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
        objectWillChange.send()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
