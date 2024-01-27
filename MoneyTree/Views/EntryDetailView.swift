//
//  ShowEntryView.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-01-27.
//

import SwiftUI
import SwiftData

struct EntryDetailView: View {
    @Bindable var entry : Entry
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        Text(entry.name)
        Text(entry.date, format: Date.FormatStyle(date: .abbreviated, time: .shortened))
        MoneyText(amount: entry.amount, type: entry.entryType)
        Text(entry.notes)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Entry.self, configurations: config)
    
    let entry = Entry(
        timestamp: Date(),
        entryType: .expense,
        amount: 8.49,
        name: "Whopper Meal Combo",
        notes: "Burger King",
        date: Date()
    )
    
    return EntryDetailView(entry: entry)
        .modelContainer(container)
}
