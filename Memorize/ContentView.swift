//
//  ContentView.swift
//  Memorize
//
//  Created by Saad Kashif on 11/4/23.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String>/*[String]*/ = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
//        VStack (alignment: .leading, spacing: 20) {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
//      .background(.gray)
    }
    
    var cards: some View {
        LazyVGrid (columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount/*emojis.indices*/, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .controlSize(.mini)
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
}
//every var in a struct that's called has to be assigned a value,
//either in its struct or in the call.
struct CardView: View {
    var content: String
    //swift is a strongly typed language, so you don't necessarily have to
    //indicate the type
    @State var isFaceUp: Bool = false //isFaceUp has been defaulted to false
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
    ContentView()
}
