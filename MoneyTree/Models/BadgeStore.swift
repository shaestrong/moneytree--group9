//
//  BadgeStore.swift
//  MoneyTree
//
//  Created by Stephany Ceron on 27/03/24.
//

import Foundation
import Observation
import SwiftUI

@Observable
final class BadgeStore {
    var badges: [Badge]
    
    init(badges: [Badge]) {
        self.badges = badges
    }
}

extension BadgeStore {
    static var data = [
        Badge(name: "First Tree", isEarned: false, view: AnyView(FirstTreeBadgeView())),
        Badge(name: "First Grown Tree", isEarned: false, view: AnyView(FirstGrownTreeBadgeView())),
        Badge(name: "Three Consecutive Savings Days", isEarned: false, view: AnyView(ThreeDaysBadgeView())),
    ]
    
    static var badgesStore: BadgeStore = BadgeStore(badges: data)
}
