
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
            aspectRatio: Constants.aspectRatio,
            itemViewWidget: { item in
                CardView(item, cardColor: .orange)
                    .padding(Constants.padding6)
                    .overlay(FlyingNumber(number: scoreChange(causedBy: item)))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1)) {
                            viewModel.choose(card: item)
                        }
                    }
            }
        )
    }
    
    private func scoreChange(causedBy card: Card) -> Int {
        return 0
    }
    
    private var bottomWidget: some View {
        HStack {
            score
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
                print(viewModel.cards)
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
