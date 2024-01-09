//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Saad Kashif on 11/4/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame
    
    let emojis: Array<String>/*[String]*/ = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    
    var body: some View {
        ScrollView {
            cards
        }
    }
    
    var cards: some View {
        LazyVGrid (columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(Color.orange)
    }
}
//every var in a struct that's called has to be assigned a value,
//either in its struct or in the call.
struct CardView: View {
    var content: String

    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack (alignment: .top) {
            let base = RoundedRectangle(cornerRadius: 12) //an example of a local variable
            Group {
                base
                    .foregroundColor(.white)
                base
                    .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10,2]))
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base
                .fill()// the fill is basically the default, we don't need it
                .opacity(isFaceUp ? 0 : 1)
            
        }
        .onTapGesture {
            isFaceUp.toggle()// = !isFaceUp
        }
    }
}







#Preview {
    EmojiMemoryGameView()
}
