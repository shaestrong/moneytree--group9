//
//  StatisticViewA.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-02-04.
//

import SwiftUI
import SwiftData
import SectionedQuery

extension Date {
    var startOfMonth: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: self)
        return calendar.date(from: components)!
    }
    
    var endOfMonth: Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month], from: self)
        components.month = (components.month ?? 0) + 1
        components.day = 0
        return calendar.date(from: components)!
    }
}

struct StatisticView: View {
    
    @SectionedQuery<String, Entry> private var entries: SectionedResults<String, Entry>
    
    @State private var savingsByDay = [String: Double]()
    @State private var totalIncome = 0.0
    @State private var totalExpense = 0.0
    
    init (month: Date) {
        let filter = #Predicate<Entry> { entry in
            entry.date >= month.startOfMonth && entry.date <= month.endOfMonth
        }
        _entries = SectionedQuery<String, Entry>(\.day, filter: filter)
    }
    
    private func calculateSavings() {
        var savingsByDay = [String: Double]()
        
        for entry in entries.flatMap({ $0 }) {
            let day = entry.day
            
            // calculate total income and expense
            if entry.entryType == .income {
                totalIncome += entry.amount
            } else {
                totalExpense += entry.amount
            }
            
            // breakdown savings by day
            let entryAmount = entry.entryType == .income ? entry.amount : 0 - entry.amount
            if let amount = savingsByDay[day] {
                savingsByDay[day] = amount + entryAmount
            } else {
                savingsByDay[day] = entryAmount
            }
        }
        
        self.savingsByDay = savingsByDay
    }
    
    var body: some View {
        NavigationStack {
            List {
                VStack(alignment: .leading) {
                    HStack {
                        VStack {
                            Text("Income").font(.subheadline).frame(maxWidth: .infinity)
                            MoneyText(amount: totalIncome, type: .income)
                        }
                        
                        VStack {
                            Text("Expense").font(.subheadline).frame(maxWidth: .infinity)
                            MoneyText(amount: totalExpense, type: .expense)
                        }
                    }
                }
                
                Section (header: Text("Daily")){
                    ForEach(savingsByDay.sorted(by: { $0.key < $1.key }), id: \.key) { day, amount in
                        HStack {
                            Text(day)
                            Spacer()
                            MoneyText(amount: abs(amount), type: amount > 0 ? .income : .expense)
                        }
                    }
                }
            }
            .onAppear(perform: calculateSavings)
            .navigationTitle("Statistics")
        }
    }
}

#Preview {
    StatisticView(month: Date.now)
        .modelContainer(for: Entry.self, inMemory: true)
}
