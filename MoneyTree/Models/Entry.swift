//
//  Entry.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-01-26.
//

import Foundation
import SwiftData
    
enum EntryType: Int, Codable {
    case expense = 0
    case income = 1
}


@Model
final class Entry {
    
    var timestamp: Date
    var entryType: EntryType
    var amount: Double
    var name: String
    var date: Date
    var notes: String
    
    var day: String {
        return self.date.formatted(date: .numeric, time: .omitted)
    }
    
    init(timestamp: Date, entryType: EntryType, amount: Double, name: String, notes: String, date: Date) {
        self.timestamp = timestamp
        self.entryType = entryType
        self.amount = amount
        self.name = name
        self.date = date
        self.notes = notes
    }
}

extension Entry {
    static var empty: Entry {
        return Entry(timestamp: Date(), entryType: .expense, amount: 0, name: "", notes: "", date: Date())
    }
}
