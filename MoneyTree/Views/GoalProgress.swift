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
    @State var progress = 0.5
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Name of the goal").font(.title2).fontWeight(.medium)
            Spacer()
            Text("$189.20/300.00").font(.subheadline)
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
