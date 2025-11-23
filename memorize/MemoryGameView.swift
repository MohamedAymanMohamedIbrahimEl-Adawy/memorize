//
//  ContentView.swift
//  memorize
//
//  Created by Mohamed Ghoneim on 05/03/2025.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var viewModel : MemoryGameViewModel
 
  
    
    var body: some View {
        VStack() {
            ScrollView {
                cards.animation(.default, value: viewModel.cards)
            }
            Spacer()
            Button("Shuffle") {
                viewModel.shuffle()
                print(viewModel.cards)
            }.foregroundColor(.white).padding(10).background(Color.blue).cornerRadius(10)

//            cardsController
            
        }.padding()
    }
   
    var cards : some View {
        LazyVGrid(
            columns: [
                GridItem(.adaptive(minimum: 85, maximum: 90), spacing: 0
                )
                ], spacing:0
        ) {
            ForEach(
                viewModel.cards,
            ) {
                card in
                CardView(
                    card: card
                ).aspectRatio(2/3, contentMode: .fit).padding(4).onTapGesture {
                    viewModel.choose(card: card)
                }
                
            }
        }
//        LazyVGrid(
//            columns: [GridItem(), GridItem(), GridItem()]
//        ) {
//            ForEach(
//                0..<cardCount,
//                id: \.self
//            ) {
//                itemIndex in
//                CardView(
//                    emojy: options[itemIndex]
//                )
//                
//            }
//        }
        
//        HStack() {
//            ForEach(
//                0..<cardCount,
//                id: \.self
//            ) {
//                itemIndex in
//                CardView(
//                    emojy: options[itemIndex]
//                )
//                
//            }
//            
//        }
    }
//    var cardsController : some View{
//        HStack (){
//            removeController
//            Spacer()
//            addController
//            
//        }.font(.title2)
//            .padding()
//    }
//    
    
    
//    var addController : some View{
////        ControllerButton(
////            onPressed: {
////                if cardCount > 1 {
////                    cardCount -= 1
////                }
////            },
////             label:"Remove",
////             symbol:"minus.circle"
////        )
//        controllerButtonFunction(by: 1, label:"Add", symbol:"plus.circle")
//    }
//    var removeController : some View {
////        ControllerButton(
////            onPressed: {
////                if cardCount < options.count  {
////                    cardCount += 1
////                }
////            },
////             label:"Add",
////             symbol:"plus.circle"
////        )
//        controllerButtonFunction(by: -1, label:"Remove", symbol: "minus.circle")
//       
//    }
    
//    func controllerButtonFunction (by offset: Int, label: String, symbol : String) -> some View {
//        ControllerButton(
//            onPressed: {
//                cardCount += offset
//            },
//             label:label,
//            symbol:symbol
//        ).disabled(cardCount + offset < 1 || cardCount + offset > viewModel.cards.count)
//    }
}

struct CardView : View{

    let card : MemorizeGame<String>.CardModel
    
    init(card: MemorizeGame<String>.CardModel) {
        self.card = card
    }
    
    var body: some View{
        
        ZStack(
            alignment: Alignment.center,
            content: {
                let baseRect = RoundedRectangle(cornerRadius: 15)
                Group {
                    baseRect
                        .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10,3]))
                        .foregroundColor(.brown)
                    Text(card.content)
                        .font(Font.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                     
                }
                
                baseRect.fill(.brown).opacity(card.isFaceUp ? 0 :1)
            }
        )
    }
}


#Preview {
    ContentView(viewModel: MemoryGameViewModel())
}

struct ControllerButton : View {
    let onPressed : () -> Void
    let label : String
    let symbol: String
    
    var body: some View {
        Button(
            action: onPressed,
            label: {
                Text(label)
                Image(systemName: symbol)
            }
        )
    }
}


//            Circle()
//            Rectangle()
//            Image(systemName: "globe")
//                .imageScale(.large).foregroundColor(Color.blue)
           
            
//Button(
//    action: {
//    if cardCount < options.count  {
//
//        cardCount += 1
//    }
//    },
//    label: {
//        Text("Add")
//        Image(systemName: "plus.circle")
//    }
//)

//                Button("Add"){
//                    if cardCount < options.count  {
//
//                        cardCount += 1
//                    }
//                }


//var trys : some View {
//    ForEach(0...4, id: \.self){
//        index in
//       
//        Text("dd")
//    }
//}




//var trys : some View {
//    let options = [
//        "🤡", "👺", "👏", "🤠", "😂","👹", "👽","😾", "🥶",
//    ]
//
//    ForEach(options.indices, id: \.self){
//        index in Text("dd")
//    }
//}
