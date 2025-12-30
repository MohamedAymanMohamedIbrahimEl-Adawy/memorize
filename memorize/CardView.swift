//
//  CardView.swift
//  memorize
//
//  Created by Mohamed Ghoneim on 29/12/2025.
//

import SwiftUI


typealias Card = MemorizeGame<String>.CardModel

struct CardView : View{
    let card : Card
    let cardColor: Color
    
    init(_ card: Card, cardColor: Color = .brown) {
        self.card = card
        self.cardColor = cardColor
    }
    
    var body: some View{
        ZStack(
            alignment: Alignment.center,
            content: {
                let baseRect = RoundedRectangle(cornerRadius: Constants.cornerRadius)
                baseRect
                    .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10,3]))
                    .foregroundColor(cardColor)
                Text(card.content)
                    .font(Font.system(size: Constants.FontSize.fontLarge))
                    .minimumScaleFactor(Constants.FontSize.fontScaleFactor)
                    .multilineTextAlignment(TextAlignment.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.padding12)
                baseRect.fill(cardColor).opacity(card.isFaceUp ? 0 :1)
                
               
            }
        ).opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}



//#Preview {
//    HStack {
//        CardView(
//            Card(id: "testId", content: "Donwn")
//        )
//        CardView(
//            Card(id: "testId2", isFaceUp: true, content: "Up")
//        )
//    }.padding(12)
//}

struct CardView_Previews: PreviewProvider {
    static var previews: some View{
        VStack {
            HStack {
                CardView(
                    Card(id: "testId", content: "Donwn")
                )
                CardView(
                    Card(id: "testId2", isFaceUp: true, content: "Up")
                )
            }
            
            HStack {
                CardView(
                    Card(id: "testId", isFaceUp: true, isMatched: true, content: "Same")
                )
                CardView(
                    Card(id: "testId2", isFaceUp: true, isMatched: true, content: "Same")
                )
            }
            HStack {
                CardView(
                    Card(id: "testId", isFaceUp: true, isMatched: true, content: "Test long text to see if it fits")
                )
                CardView(
                    Card(id: "testId2", isFaceUp: true, isMatched: true, content: "Same")
                )
            }
        }.padding(12)
    }
}
