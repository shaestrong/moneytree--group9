//
//  GoalProgress.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-01-26.
//

import SwiftUI
import SwiftData

struct RoundedRectProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 14)
                .frame(width: geometry.size.width, height: 16)
                    .foregroundColor(.gray)
                    .overlay(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 14)
                            .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * geometry.size.width - 6, height: 10)
                            .offset(x: 3)
                            .foregroundColor(.green)
                }
        }.frame(height: 16)
    }
}
 

struct GoalProgress: View {
    //@State var progress = 0.5
    @State var goal : Goal
    @State private var showingGoalSheet = false
    
    var body: some View {
        Button(action: editGoal) {
            VStack (alignment: .leading) {
                Text(goal.name).font(.title2).fontWeight(.medium)
                Spacer()
                Text("Goal: \(formattedDate)")
                Text("\(goal.current, specifier: "%.2f")/\(goal.target, specifier: "%.2f")")
                    .font(.subheadline)
                ProgressView(value: goal.current / goal.target)
                    .progressViewStyle(RoundedRectProgressViewStyle())
            }
            .padding()
            .card()
        }
        .foregroundColor(.black)
        .sheet(isPresented: $showingGoalSheet, content: {
            NavigationView {
                GoalEditorView(goal:goal)
                    .navigationBarTitleDisplayMode(.inline)
            }
        })
    }
    
    private var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: goal.deadline)
    }
    
    private func editGoal() {
        showingGoalSheet.toggle()
    }
}

#Preview {
    GoalProgress(goal: Goal(name: "Test Goal", target: 100, deadline: Date()))

   
}
