//
//  GoalListItem.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-02-14.
//

import SwiftUI
import SwiftData

struct GoalListItem: View {
    
    var goal: Goal
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(goal.name).fontWeight(.medium)
                Text(goal.target, format: .currency(code: "CAD")).font(.subheadline)
            }
            
            Spacer()
            
            ProgressView(value: goal.progress)
                .progressViewStyle(CircularProgressViewStyle(stroke: 6, size: 32))
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Goal.self, configurations: config)
    
    let goal = Goal(name: "Tesla", target: 1000000, deadline: Date())
    
    return GoalListItem(goal: goal)
}
