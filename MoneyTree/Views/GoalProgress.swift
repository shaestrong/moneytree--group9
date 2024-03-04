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

struct CircularProgressViewStyle: ProgressViewStyle {
    
    var stroke: Double
    var size: Double
    
    func makeBody(configuration: Configuration) -> some View {
        
        GeometryReader { geometry in
            Circle()
                .stroke(
                    Color.gray.opacity(0.5),
                    lineWidth: stroke
                ).frame(width: geometry.size.height, height: geometry.size.height)
                    .overlay(alignment: .leading) {
                        Circle()
                            .trim(from: 0, to: configuration.fractionCompleted ?? 0)
                            .stroke(
                                Color.green,
                                style: StrokeStyle(
                                    lineWidth: stroke,
                                    lineCap: .round
                                )
                            )
                            .rotationEffect(.degrees(-90))
                            .frame(width: geometry.size.height, height: geometry.size.height)
                }
        }.frame(width: size, height: size)
    }
}
 

struct GoalProgress: View {
    //@State var progress = 0.5
    @State var goal : Goal
    @State private var showingGoalSheet = false
    
    var body: some View {
        NavigationLink {
            GoalDetailView(goal: goal)
        } label : {
            VStack (alignment: .leading) {
                Text(goal.name).font(.title2).fontWeight(.medium)
                Spacer()
                Text("Goal: \(formattedDate)")
                Text("$\(goal.current, specifier: "%.2f")/$\(goal.target, specifier: "%.2f")")
                    .font(.subheadline)
                ProgressView(value: goal.current / goal.target)
                    .progressViewStyle(RoundedRectProgressViewStyle())
            }
            .padding()
            .card()
            .foregroundColor(.primary)
            //        .sheet(isPresented: $showingGoalSheet, content: {
            //            AddTreeFormView(isPresented: $showingGoalSheet, goal: goal)
            //        })
        }
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
