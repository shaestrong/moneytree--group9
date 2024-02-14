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
    var deadline: Date
    
    @Relationship(deleteRule: .nullify, inverse: \Entry.goal) var entries: [Entry] = []
    
    var current: Double {
        return entries.map({ $0.amount }).reduce(0, +)
    }
    
    var progress: Double {
        return current / target
    }
    
    init(name: String, target: Double, deadline: Date) {
        self.name = name
        self.target = target
        self.deadline = deadline
    }
}
