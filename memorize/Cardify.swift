//
//  Cardify.swift
//  memorize
//
//  Created by Mohamed Ghoneim on 31/12/2025.
//

import SwiftUI

struct Cardify: ViewModifier {
    let isFaceUp: Bool
    let cardColor: Color
    
    func body(content: Content) -> some View {
      
        ZStack(
            alignment: Alignment.center,
            content: {
                let baseRect = RoundedRectangle(cornerRadius: Constants.cornerRadius)
//                baseRect
//                    .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10,3]))
//                    .foregroundColor(cardColor)
//                content
//                baseRect.fill(cardColor).opacity(isFaceUp ? 0 :1)
                
                /// Another way
                baseRect.strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10,3]))
                    .foregroundColor(.orange)
                    .background(baseRect.fill(.white))
                    .overlay( content)
                baseRect.fill(cardColor).opacity(isFaceUp ? 0 :1)
                

            }

        )
    }
}

extension View {
    func cardify(isFaceUp: Bool, cardColor: Color) -> some View {
      modifier(Cardify(isFaceUp: isFaceUp, cardColor: cardColor))
    }
}
