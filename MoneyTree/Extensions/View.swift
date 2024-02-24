//
//  View.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-02-24.
//

import Foundation
import SwiftUI

extension View {
    func getSafeAreaInsets() -> UIEdgeInsets {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        return windowScene.windows.first?.safeAreaInsets ?? .zero
    }
    
    func getScreenSize() -> CGSize {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        
        return windowScene.windows.first?.screen.bounds.size ?? .zero
    }
}
