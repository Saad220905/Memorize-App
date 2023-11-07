//
//  ContentView.swift
//  Memorize
//
//  Created by Saad Kashif on 11/4/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack (alignment: .leading, spacing: 20) {
        HStack() {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundStyle(.green)
        .padding()
        .background(.gray)
    }
}

struct CardView: View {
    var isFaceUp: Bool = false //isFaceUp has been defaulted to false
    var body: some View {
        ZStack () {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10,2]))
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}











#Preview {
    ContentView()
}
