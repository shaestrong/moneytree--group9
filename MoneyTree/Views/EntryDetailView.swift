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
            }.padding(.vertical, 4)
            
            if entry.entryType == .income {
                if entry.goal != nil {
                    Section {
                        HStack {
                            VStack (alignment: .leading) {
                                Text(entry.goal!.name).fontWeight(.medium)
                                Text(entry.goal!.target, format: .currency(code: "CAD")).font(.subheadline)
                            }
                            
                            Spacer()
                            
                            ProgressView(value: 0.33)
                                .progressViewStyle(CircularProgressViewStyle(stroke: 6, size: 32))
                        }
                    } header: {
                        Text("Goal")
                    } footer: {
                        let percentage = String(format: "%.2f", entry.amount / entry.goal!.target * 100)
                        
                        Text("Your contribution has made this goal advanced for \(percentage)%")
                    }
                } else {
                    Button("Contribute") {
                        
                    }
                }
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
        }
        .padding(.top, 0)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
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

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Entry.self, configurations: config)
    
    let entry = Entry(
        timestamp: Date(),
        entryType: .income,
        amount: 12.99,
        name: "Whopper Meal Combo",
        notes: "Bought a wopper meal from Burger King, long long text",
        date: Date()
    )
    
    
    return NavigationStack {
        EntryDetailView(entry: entry)
            .modelContainer(container)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Schema([Entry.self, Goal.self]), configurations: config)
    
    let entry = Entry(
        timestamp: Date(),
        entryType: .income,
        amount: 20.00,
        name: "Grandma",
        notes: "Grandma gave me the money for a tripple whopper combo. However I will save it for buying a Tesla!",
        date: Date()
    )
    
    container.mainContext.insert(entry)
    entry.goal = Goal(name: "Tesla", target: 129200.0, deadline: Date())
    
    return NavigationStack {
        EntryDetailView(entry: entry)
            .modelContainer(container)
    }
}
