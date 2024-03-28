//
//  Badge.swift
//  MoneyTree
//
//  Created by Stephany Ceron on 27/03/24.
//

import Foundation
import SwiftUI

struct Badge: Identifiable {
    let id: UUID
    let name: String
    var isEarned: Bool
    let view: AnyView
    
    internal init(id: UUID = UUID(), name: String, isEarned: Bool, view: AnyView) {
        self.id = id
        self.name = name
        self.isEarned = isEarned
        self.view = view
    }
}
