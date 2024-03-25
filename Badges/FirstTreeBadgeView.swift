//
//  FirstGoalBadgeView.swift
//  MoneyTree
//
//  Created by Shaelyn Strong on 2024-03-21.
//

import SwiftUI

struct FirstTreeBadgeView: View {
    var body: some View {
        Section {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.yellow.opacity(0.5))
                    .frame(width: 150, height: 150)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.yellow, lineWidth: 3)
                    )
                
                VStack(spacing: -10) {
                    Text("FIRST TREE")
                        .font(.caption)
                        .foregroundColor(.black)
                        .padding()
                    
                    Image(systemName: "tree")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .padding()
                        .foregroundColor(.green)
                }
            }
            .padding()
        }
    }
}

#Preview {
    FirstTreeBadgeView()
}
