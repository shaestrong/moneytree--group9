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
    
    init(timestamp: Date, entryType: EntryType, amount: Double, name: String, notes: String, date: Date) {
        self.timestamp = timestamp
        self.entryType = entryType
        self.amount = amount
        self.name = name
        self.date = date
        self.notes = notes
    }
}
