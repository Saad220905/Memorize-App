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
        ZStack (alignment: .center) {
            let base = RoundedRectangle(cornerRadius: 12) //an example of a local variable
            Group {
                base.fill(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10,2]))
                Pie(endAngle: .degrees(240))
                    .opacity(0.4)
                    .overlay(
                        Text(card.content)
                            .font(.system(size: 200))
                            .minimumScaleFactor(0.01)
                            .multilineTextAlignment(.center)
                            .aspectRatio(1, contentMode: .fit)
                            .padding(5)
                    )
                    .padding(5)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base
                .fill()// the fill is basically the default, we don't need it
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
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

