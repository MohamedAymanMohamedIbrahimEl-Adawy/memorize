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
     
    var indexOfTheOneAndOnlyFaceUpCard:Int? {
        get {
            // let faceUpCardsIndices = cards.indices.filter {
            //     index in cards[index].isFaceUp
            // }
            // return faceUpCardsIndices.count == 1 ?  faceUpCardsIndices.first : nil

            // Or
            
            cards.indices.filter {
                index in cards[index].isFaceUp
            }.only
         
            
        } set {
            cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) }
            // The previous line of code is equal to the following commented lines
//            for index in cards.indices {
//                if index == newValue {
//                    cards[index].isFaceUp = true
//                } else{
//                    cards[index].isFaceUp = false
//                }
//            }
        }
    }
    
    //  if you put underbar _ before variable name,
    //  this mean you don't need to call the variable name when calling the function
    //  so you will call choose(myCard)
    mutating  func choose(_ card: CardModel){
        print("Card: \(card.content)")
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if (!cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched){
                print("0")
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    print("1")
                    cards[chosenIndex].isFaceUp = true
                    
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                       cards[chosenIndex].isMatched = true
                       cards[potentialMatchIndex].isMatched = true
                    }
                    
                } else {
                    print("Else case")
                  
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                print("3")
               
             }
        }

//         if let chosenIndex = indexOf(card) {
//              if (!cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched){
//                 cards[chosenIndex].isFaceUp.toggle()
//               }
//         }
      

    }

    private func indexOf(_ card: CardModel) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
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
        var isFaceUp = false
        var isMatched = false
        let content: GenericContent
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
