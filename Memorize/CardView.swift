//
//  CardView.swift
//  Memorize
//
//  Created by Saad Kashif on 6/8/24.
//

import SwiftUI

//every var in a struct that's called has to be assigned a value,
//either in its struct or in the call.
struct CardView: View {
    let card: MemoryGame<String>.Card
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(0.4)
            .overlay(
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(5)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(.spin(duration: 1), value: card.isMatched)
            )
            .padding(5)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}


extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: 1).repeatForever(autoreverses: false)
    }
}

#Preview {
    HStack {
        CardView(MemoryGame<String>.Card(isFaceUp : true, content: "X", id: "test1"))
        CardView(MemoryGame<String>.Card(content: "X", id: "test1"))
    }
    .padding()
    .foregroundColor(.green)
}

