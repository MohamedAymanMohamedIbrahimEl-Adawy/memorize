
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : MemoryGameViewModel
    
    
    var body: some View {
        VStack(
            alignment: .center
        ) {
            AspectVGrid(
                items: viewModel.cards,
                aspectRatio: Constants.aspectRatio,
                itemViewWidget: { item in
                    CardView(item, cardColor: .orange)
                        .padding(Constants.padding6) 
                        .onTapGesture {
                            viewModel.choose(card: item)
                        }
                }
            ).animation(.default, value: viewModel.cards)
            
            Button("Shuffle") {
                viewModel.shuffle()
                print(viewModel.cards)
            }.foregroundColor(.white)
                .padding(Constants.padding12)
             .background(Color.blue)
             .cornerRadius(Constants.cornerRadius)
            
        }.padding()
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
