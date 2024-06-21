//
//  Cardify.swift
//  Memorize
//
//  Created by Saad Kashif on 6/11/24.
//

import SwiftUI

struct Cardify : ViewModifier, Animatable {
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUp : Bool {
        rotation < 90
    }
    
    var rotation: Double
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }
    
    
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
        .rotation3DEffect(.degrees(rotation), axis: (0,1,0))
        //    .animation(.linear(duration: 3), value: isFaceUp)
    }
}


extension View {
    func cardify(isFaceUp : Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))  //you don't really need to put the return and the self.
    }
}
