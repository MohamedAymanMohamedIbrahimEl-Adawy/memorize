
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : MemoryGameViewModel
    
    
    var body: some View {
        VStack(
            alignment: .center
        ) {
            cards
            bottomWidget
        }.padding()
    }
    
    private var cards: some View {
        AspectVGrid(
            items: viewModel.cards,
            aspectRatio: Constants.aspectRatio
        ){
            item in
            if isDealt(item) {
                CardView(item, cardColor: .orange)
                    .matchedGeometryEffect(id: item.id, in: dealingNamespace)
                    .transition(.asymmetric(insertion: .identity, removal: .identity))
                    .padding(Constants.padding6)
                    .overlay(FlyingNumber(number: scoreChange(causedBy: item)))
                    .zIndex(scoreChange(causedBy: item) != 0 ? 100 : 0)
                    .onTapGesture {
                        choose(card: item)
                    }
                   
            }
        }
    }
    
    @State private var dealt = Set<Card.ID>()
    
    private func isDealt(_ card: Card) -> Bool {
        dealt.contains(card.id)
    }
    
    private var undealtCards: [Card] {
        viewModel.cards.filter {
            !isDealt($0)
        }
        
    }
    
    @Namespace private var dealingNamespace
    
    private var deck: some View {
        ZStack {
            ForEach(undealtCards) { card in
                CardView(card, cardColor: .orange)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(.asymmetric(insertion: .identity, removal: .identity))
            }
        }
        .frame(width: deckWidth, height: deckWidth /  Constants.aspectRatio)
        .onTapGesture {
            deal()
            
        }
    }
    
    private func deal() {
        var delay: TimeInterval = 0
        
       
        for card in viewModel.cards {
            withAnimation(.easeInOut(duration: 1).delay(delay)){
                _ = dealt.insert(card.id)
            }
            delay += 0.15
        }
    }
    private let deckWidth: CGFloat = 50
    
    private func choose(card: Card) {
        withAnimation {
            let scoreBeforeChoosing = viewModel.score
            viewModel.choose(card: card)
            let scoreChange = viewModel.score - scoreBeforeChoosing
            lastScoreChange = (amount: scoreChange, causedByCardId: card.id)
        }
    }
    
    @State private var lastScoreChange = (0, causedByCardId: "")
    
    private func scoreChange(causedBy card: Card) -> Int {
        let (amount, id) = lastScoreChange
        return card.id == id ? amount : 0
    }
    
    private var bottomWidget: some View {
        HStack {
            score
            Spacer()
            deck
            Spacer()
            shuffle
            
        }
    }
    
    private var score: some View {
        Text("Score: \(viewModel.score)").animation(nil)
    }
    
    private var shuffle: some View {
        Button("Shuffle") {
            withAnimation(.easeInOut(duration: 1)) {
                viewModel.shuffle()
            }
        }.foregroundColor(.white)
            .padding(Constants.padding12)
            .background(Color.blue)
            .cornerRadius(Constants.cornerRadius)
    }
    
}

//
//struct ControllerButton : View {
//    let onPressed : () -> Void
//    let label : String
//    let symbol: String
//    
//    var body: some View {
//        Button(
//            action: onPressed,
//            label: {
//                Text(label)
//                Image(systemName: symbol)
//            }
//        )
//    }
//}

#Preview {
    ContentView(viewModel: MemoryGameViewModel())
}
