//
//  Goal.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-01-26.
//

import Foundation
import SwiftData

@Model
final class Goal {
    
    var name: String
    var target: Double
    var current: Double
    var deadline: Date
    
    var entries: [Entry] = []
    
    init(name: String, target: Double, deadline: Date) {
        self.name = name
        self.target = target
        self.deadline = deadline
        self.current = 0
    }
}
