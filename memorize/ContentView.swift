//
//  ContentView.swift
//  memorize
//
//  Created by Mohamed Ghoneim on 05/03/2025.
//

import SwiftUI

struct ContentView: View {
    let options: Array<String> = [
        "🤡", "👺", "👏", "🤠", "😂","👹", "👽","😾", "🥶",
    ]
    @State var cardCount: Int = 4;
    
    var body: some View {
        VStack() {
            ScrollView {
                cards
            }
            Spacer()
            cardsController
            
        }.padding()
    }
    var cards : some View {
        LazyVGrid(
            columns: [GridItem(.adaptive(minimum: 90, maximum: 100))]
        ) {
            ForEach(
                0..<cardCount,
                id: \.self
            ) {
                itemIndex in
                CardView(
                    emojy: options[itemIndex]
                ).aspectRatio(2/3, contentMode: .fit)
                
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
    var cardsController : some View{
        HStack (){
            removeController
            Spacer()
            addController
            
        }.font(.title2)
            .padding()
    }
    
    
    
    var addController : some View{
//        ControllerButton(
//            onPressed: {
//                if cardCount > 1 {
//                    cardCount -= 1
//                }
//            },
//             label:"Remove",
//             symbol:"minus.circle"
//        )
        controllerButtonFunction(by: 1, label:"Add", symbol: "plus.circle")
    }
    var removeController : some View {
//        ControllerButton(
//            onPressed: {
//                if cardCount < options.count  {
//                    cardCount += 1
//                }
//            },
//             label:"Add",
//             symbol:"plus.circle"
//        )
        controllerButtonFunction(by: -1, label:"Remove", symbol: "minus.circle")
    }
    
    func controllerButtonFunction (by offset: Int, label: String, symbol : String) -> some View {
//            Button(
//                action: {
//                    cardCount += offset
//                },
//                label: {
//                    Text(label)
//                    Image(systemName: symbol)
//                }
//            )
        ControllerButton(
            onPressed: {
                cardCount += offset
            },
             label:label,
            symbol:symbol
        ).disabled(cardCount + offset < 1 || cardCount + offset > options.count)
    }
}

struct CardView : View{
    @State var isFaceUp: Bool = false
    let emojy : String
    var body: some View{
        
        ZStack(
            alignment: Alignment.center,
            content: {
                let baseRect = RoundedRectangle(cornerRadius: 15)
                Group {
                    baseRect                    .fill(.white)
                    baseRect
                        .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10,3]))
                        .foregroundColor(.brown)
                    Text(emojy)
                        .font(Font.system(size: 30))
                        .foregroundColor(Color.brown).padding(12)
                }
                
                baseRect.fill(.brown).opacity(isFaceUp ? 0 :1)
            }
        ).onTapGesture(count: 1 ) {
            print("tapped");
            isFaceUp.toggle() // isFaceUp = !isFaceUp
        }
    }
}


#Preview {
    ContentView()
}

struct ControllerButton : View {
    let onPressed :  () -> Void
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
