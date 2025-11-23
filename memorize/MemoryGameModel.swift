//
//  MemorizeGame.swift
// Model

import Foundation

struct MemorizeGame<GenericContent> where GenericContent: Equatable {
    private(set) var cards: Array<CardModel>
    
    init(numberOfBPairsOFcards: Int, cardContentFunc: (Int) -> GenericContent) {
        cards = []  //  cards = Array<CardModel>()
        for pairIndex in 0..<max(2, numberOfBPairsOFcards) {
            let contnet = cardContentFunc(pairIndex)
            
            cards.append(CardModel(id: "\(pairIndex + 1)a", content: contnet))
            cards.append(CardModel(id: "\(pairIndex + 1)b", content: contnet))
        }
    }
    
    

   mutating  func shuffle(){
        cards.shuffle()
    }

    
    //  if you put underbar _ before variable name,
    //  this mean you don't need to call the variable name when calling the function
    //  so you will call choose(myCard)
    func choose(_ card: CardModel){
          print("Card: \(card)")
        card.isFaceUp.toggle()
    }
    //  if you didn't put underbar _ before variable name,
    //  this mean you  need to call the variable name when calling the function
    //  so you will call choose(card: myCard)
    //    func choose(card: CardModel){
    //
    //    }
       
    struct CardModel: Equatable, Identifiable, CustomDebugStringConvertible {
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "Yes" : "No")"
        }
        
    
        var id: String
        var isFaceUp = true
        var isMatched = false
        let content: GenericContent
        
    }
}
