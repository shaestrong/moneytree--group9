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
            .background(Color(UIColor.secondarySystemGroupedBackground))
            .cornerRadius(20)
    }
}

extension View {
    func card() -> some View {
        modifier(CardBackground())
    }
}
