//
//  GoalPicker.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-02-14.
//

import SwiftUI
import SwiftData

struct GoalPicker: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    var entry: Entry
    
    @Query private var goals: [Goal]
    
    private func associateGoal (goal: Goal) {
        entry.goal = goal
        dismiss()
    }
    
    var body: some View {
        Form {
            Section {
                ForEach(goals) { goal in
                    Button (action: { associateGoal(goal: goal) }) {
                        GoalListItem(goal: goal)
                    }.buttonStyle(.plain)
                }
            }
            
            // remove the goal
            Button("Remove contribution", role: .destructive) {
                entry.goal = nil
                dismiss()
            }
        }.navigationTitle(entry.goal != nil ? "Change a Goal" : "Select a Goal")
         .navigationBarTitleDisplayMode(.inline)
         .toolbar(.hidden, for: .tabBar)
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
    
    return GoalPicker(entry: entry)
}
