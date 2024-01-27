//
//  GoalProgress.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-01-26.
//

import SwiftUI
 
struct RoundedRectProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 14)
                .frame(width: geometry.size.width, height: 24)
                    .foregroundColor(.gray)
                    .overlay(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 14)
                            .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * geometry.size.width, height: 24)
                            .foregroundColor(.green)
                }
        }.frame(height: 28)
    }
}
 

struct GoalProgress: View {
    @State var progress = 0.5
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Name of the goal").font(.title3)
            Text("$189.20 / $190.15").font(.subheadline)
            ProgressView(value: progress)
                .progressViewStyle(RoundedRectProgressViewStyle())
        }
        .padding()
        .card()
    }
}

#Preview {
    GoalProgress()
}
