//
//  MemorizeGame.swift
//  memorize
//
//  Created by Mohamed Ghoneim on 22/04/2025.
//

import Foundation

struct MemorizeGame<GenericContent> {
    var cards: Array<CardModel>
    
    func choose(card: CardModel){
        
    }
    
    struct CardModel{
        var isFaceUp: Bool
        var isMatched: Bool
        var content: GenericContent
    }
}
