//
//  CreateEntryView.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-01-26.
//

import SwiftUI

struct EntryEditorView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var entryType: EntryType = .expense;
    
    @State var amount: Double = 0;
    
    @State var name = "";
    
    @State var notes = "";
    
    @State var date = Date();
    
    @State var entry: Entry?
    
    private func addEntry() {
        if (entry == nil) {
            entry = Entry(timestamp: Date(), entryType: entryType, amount: amount, name: name, notes: notes, date: date)
            modelContext.insert(entry!)
        } else {
            entry!.entryType = entryType
            entry!.amount = amount
            entry!.name = name
            entry!.notes = notes
            entry!.date = date
        }
        
        dismiss()
    }
    
    var body: some View {
        VStack {
            // below is a segment control to switch income / expense
            Picker("Type", selection: $entryType) {
                Text("Expense").tag(EntryType.expense)
                Text("Income").tag(EntryType.income)
            }.pickerStyle(SegmentedPickerStyle())
             .padding(.horizontal)
            
            // create a list of input
            Form {
                TextField("Name", text: $name)
                
                TextField("Amount", value: $amount, format: .currency(code: "CAD"))
                    .keyboardType(.decimalPad)
                
                DatePicker("Date", selection: $date, displayedComponents: .date)
            
                // input for notes
                Section(header: Text("Notes")) {
                    TextField("Notes", text: $notes, axis: .vertical)
                }
            }
            
            // large button to submit
            Button(action: addEntry) {
                Text(entry == nil ? "Add" : "Update")
                 .frame(maxWidth: .infinity)
            }
             .controlSize(.large)
             .buttonStyle(.borderedProminent)
             .padding(.horizontal)
             .padding(.vertical, 8)
        }.navigationTitle(entry == nil ? "Add Entry" : "Edit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
            .onAppear {
                if let entry = entry {
                    entryType = entry.entryType
                    amount = entry.amount
                    name = entry.name
                    notes = entry.notes
                    date = entry.date
                }
            }
    }
}

#Preview {
    EntryEditorView()
}
