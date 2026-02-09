//
//  EmojiMemorizeGame.swift
//
// View model

import SwiftUI


class MemoryGameViewModel: ObservableObject {

//   private var model: MemorizeGame<String> = MemorizeGame(
//        numberOfBPairsOFcards: 4,
//        cardContent: createCardContnet
//    )
    
//    Another way of difineing the previous model
//    private var model = MemorizeGame(
//        numberOfBPairsOFcards: 4
//    ){
//        index in return [
//            "🤡", "👺", "👏", "🤠", "😂","👹", "👽","😾", "🥶",
//        ][index]
//    }
    
        //  Another way of difineing the previous model
   private static func createMemoryGame() -> MemorizeGame<String> {
        MemorizeGame(
              numberOfBPairsOFcards: 12
          ){
              index in
              if emojis.indices.contains(index) {
                  return emojis[index]
              } else {
                  return "?!"
              }
          }
    }

    @Published  private var model = createMemoryGame()
    
        private static let emojis =  [
            "🤡", "👺", "👏", "🤠", "😂","👹", "👽","😾", "🥶", "😤",
            "🎱", "⚽️", "🎾"
        ]
        
        var cards: Array<Card>{
            return model.cards
        }
        var score: Int{
            model.score
        }
        
        // MARK: - Intents
        
        func shuffle() {
       
            model.shuffle()
        }
        
        func choose(card: Card){
            model.choose( card)
        }
} 
 
func createCardContnet(index: Int) -> String {
    return [
        "🤡", "👺", "👏", "🤠", "😂","👹", "🧐", "🥳","😶‍🌫️" , "👽","😾", "🥶",
    ][index]
}
