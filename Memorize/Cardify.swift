//
//  Cardify.swift
//  Memorize
//
//  Created by Saad Kashif on 6/11/24.
//

import SwiftUI

struct Cardify : ViewModifier {
    let isFaceUp : Bool
    
    func body(content : Content) -> some View {
        
        ZStack (alignment: .center) {
            let base = RoundedRectangle(cornerRadius: 12) //an example of a local variable
            base.strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [10,2]))
                .background(base.fill(.white))
                .overlay(content)
                .opacity(isFaceUp ? 1 : 0)
            base
                .fill()// the fill is basically the default, we don't need it
                .opacity(isFaceUp ? 0 : 1)
        }
    }
}


extension View {
    func cardify(isFaceUp : Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))  //you don't really need to put the return and the self.
    }
}
