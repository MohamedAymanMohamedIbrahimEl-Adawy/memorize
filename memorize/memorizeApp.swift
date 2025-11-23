//
//  memorizeApp.swift
//  memorize
//
//  Created by Mohamed Ghoneim on 05/03/2025.
//

import SwiftUI

@main
struct memorizeApp: App {
    @StateObject var game = MemoryGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
