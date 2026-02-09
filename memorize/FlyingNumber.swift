//
//  FlyingNumber.swift
//  memorize
//
//  Created by Mohamed Ghoneim on 12/01/2026.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    var body: some View {
        if number != 0 {
            Text(number, format: .number)
        }
    }
}

#Preview {
    FlyingNumber(number: 5)
}
