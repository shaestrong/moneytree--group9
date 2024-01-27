//
//  CreateEntryView.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-01-26.
//

import SwiftUI

struct CreateEntryView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var entryType: EntryType = .expense;
    
    @State var amount: Double = 0;
    
    @State var name = "";
    
    @State var notes = "";
    
    @State var date = Date();
    
    private func addEntry() {
        let entry = Entry(timestamp: Date(), entryType: entryType, amount: amount, name: name, notes: notes, date: date)
        
        modelContext.insert(entry)
        
        dismiss()
    }
    
    var body: some View {
        VStack {
            // below is a segment control to switch income / expense
            Picker("Type", selection: $entryType) {
                Text("Expense").tag(EntryType.expense)
                Text("Income").tag(EntryType.income)
            }.pickerStyle(SegmentedPickerStyle())
             .padding(.horizontal, 16)
             .padding(.vertical, 12)
            
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
                Text("Add")
                 .frame(maxWidth: .infinity)
            }
             .controlSize(.large)
             .buttonStyle(.borderedProminent)
             .padding(.horizontal, 16)
             .padding(.vertical, 12)
        }
    }
}

#Preview {
    CreateEntryView()
}
