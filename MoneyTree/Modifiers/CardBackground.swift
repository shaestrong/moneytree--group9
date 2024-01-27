//
//  CardBackground.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-01-26.
//

import SwiftUI

// view modifier
struct CardBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background()
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 4)
    }
}

extension View {
    func card() -> some View {
        modifier(CardBackground())
    }
}
