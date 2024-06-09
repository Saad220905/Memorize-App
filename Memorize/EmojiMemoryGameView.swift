//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Saad Kashif on 11/4/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    //@ObservedObject basically says that if something changed,
    //redraw me.

    let aspectRatio : CGFloat = 2/3
    
    var body: some View {
        VStack {
            cards
                .animation(.default, value: viewModel.cards)
            Button("shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    //you'd have to write @ViewBuilder to prevent the function from complaining about
    //not having a return type
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio : aspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundColor(Color.orange)
    }
}





struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
