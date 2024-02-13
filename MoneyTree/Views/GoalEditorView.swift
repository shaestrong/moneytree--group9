//
//  GoalEditorView.swift
//  MoneyTree
//
//  Created by Stephany Ceron on 12/02/24.
//

import SwiftUI

struct GoalEditorView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var name = "";
    
    @State var target: Double = 0;
    
    @State var deadline = Date();
    
    @State var goal: Goal?
    
    private func addGoal() {
        if (goal == nil){
            goal = Goal(name: name, target: target, deadline: deadline)
            modelContext.insert(goal!)
        } else {
            goal!.name = name
            goal!.target = target
            goal!.deadline = deadline
        }
        dismiss()
    }
    
    var body: some View {
        VStack {
            Form {
                Section (header: Text("Give your goal a cool name!"),
                         footer: Text("This will help you remember what your goal is about.")){
                    TextField("Name", text: $name)
                }
                
                Section (header: Text("Set your savings target!"),
                         footer: Text("This is the amount of money you want to save. It can be for a toy, a game, or anything else you like!")){
                    TextField("Target", value: $target, format: .currency(code: "CAD"))
                        .keyboardType(.decimalPad)
                }
                
                Section (header: Text("Choose the date to reach your goal!"),
                         footer: Text("Select the date by when you want to achieve your savings goal.")){
                    DatePicker("Deadline", selection: $deadline, displayedComponents: .date)
                }
            }
            
            Button(action: addGoal) {
                Text(goal == nil ? "Add" : "Update")
                 .frame(maxWidth: .infinity)
            }
             .controlSize(.large)
             .buttonStyle(.borderedProminent)
             .padding(.horizontal)
             .padding(.vertical, 8)
        }
        .navigationTitle(goal == nil ? "Add Goal" : "Edit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
            .onAppear {
                if let goal = goal {
                    name = goal.name
                    target = goal.target
                    deadline = goal.deadline
                }
            }
    }
}

#Preview {
    GoalEditorView()
}
