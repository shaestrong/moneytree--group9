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
        List {
            VStack (alignment: .leading) {
                Text(entry.name).font(.title2).fontWeight(.medium)
                
                MoneyText(amount: entry.amount, type: entry.entryType)
                    .fontWeight(.medium)
                
                HStack {
                    Image(systemName: "calendar")
                        .font(.subheadline)
                    
                    Text(entry.date, format: Date.FormatStyle(date: .abbreviated, time: .shortened)).font(.subheadline)
                }.padding(.top, 8)
            }
            
            if entry.notes != "" {
                Section(header: Text("notes")){
                    Text(entry.notes)
                }
            }
            
            Section {
                Button("Edit") {
                }.background(
                    NavigationLink("", destination: EntryEditorView(
                        entry: entry
                    )).opacity(0)
                )
                Button("Remove", role: .destructive) {
                    modelContext.delete(entry)
                }
            }
        }.toolbar(.hidden, for: .tabBar)
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
        notes: "Bought a wopper meal from Burger King, long long text",
        date: Date()
    )
    
    
    return NavigationStack {
        EntryDetailView(entry: entry)
            .modelContainer(container)
    }
}
