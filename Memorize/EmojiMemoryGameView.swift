//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Saad Kashif on 11/4/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    typealias Card = MemoryGame<String>.Card
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    //@ObservedObject basically says that if something changed,
    //redraw me.
    
    let aspectRatio : CGFloat = 2/3
    
    var body: some View {
        VStack {
            cards
                .foregroundColor(.clear)
            //.animation(.default, value: viewModel.cards)
            HStack {
                score
                Spacer()
                shuffle
            }
        }
        .padding()
    }
    
    private var score: some View {
        Text("Score: \(viewModel.score)")
            .animation(nil)
    }
    
    private var shuffle: some View {
        Button("shuffle") {
            withAnimation() { // default animation being used
                viewModel.shuffle()
            }
        }
    }
    
    
    //you'd have to write @ViewBuilder to prevent the function from complaining about
    //not having a return type
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio : aspectRatio) { card in
            CardView(card)
                .padding(4)
                .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                .zIndex(scoreChange(causedBy: card) != 0 ? 1 : 0)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        let scoreBeforeChoosing = viewModel.score
                        viewModel.choose(card)
                        let scoreChange = viewModel.score - scoreBeforeChoosing
                        lastScoreChange = (scoreChange, causedByCardId: card.id)
                    }
                }
        }
        .foregroundColor(Color.orange)
    }
    
    //@State private var lastScoreChange: (amount: Int, causedByCardId: Card.ID) = (amount: 0, causedByCardId: "")
    @State private var lastScoreChange = (0, causedByCardId: "")
    
    
    private func scoreChange(causedBy card: Card) -> Int {
        let (amount, id) = lastScoreChange
        return card.id == id ? amount : 0
    }
}





struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
