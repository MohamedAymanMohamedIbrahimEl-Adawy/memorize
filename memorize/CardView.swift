
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
                
                 Pie(
                     endAngle: Angle.degrees(240),
                 )
                     .foregroundColor(.orange)
                     .opacity(Constants.Pie.opacity)
                     .overlay(
                         Text(card.content)
                             .font(Font.system(size: Constants.FontSize.fontMedium))
                             .minimumScaleFactor(Constants.FontSize.fontScaleFactor)
                             .multilineTextAlignment(TextAlignment.center)
                             .aspectRatio(1, contentMode: .fit)
                             .rotationEffect(.degrees(card.isMatched ? 360 : 0))
//                             .animation(.easeInOut(duration: 2), value: card.isMatched)
//                            .animation(.easeInOut(duration: 2).repeatForever(autoreverses: false), value: card.isMatched)
                     )
                     .animation(.spin(duration: 1), value:  card.isMatched)
                     .padding(Constants.padding6)
                      .cardify(
                            isFaceUp: card.isFaceUp,
                            cardColor: cardColor
                      )


            }

        ).opacity(card.isFaceUp || !card.isMatched ? 1 : 0)

    }

}


extension Animation {
    static func spin(duration: TimeInterval) -> Animation{
        .linear(duration: duration).repeatForever(autoreverses: false)
    }
}


///
// Preview way 1

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

//

///
// Preview way 2

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

