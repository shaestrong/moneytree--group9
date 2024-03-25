//
//  FirstGrownTreeBadge.swift
//  MoneyTree
//
//  Created by Shaelyn Strong on 2024-03-24.
//

import SwiftUI

struct FirstGrownTreeBadgeView: View {
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
                    Text("FIRST GROWN TREE")
                        .font(.caption)
                        .foregroundColor(.black)
                        .padding()
                    
                    Image(systemName: "tree.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .foregroundColor(.green)
                }
            }
            .padding()
        }
    }
}

#Preview {
    FirstGrownTreeBadgeView()
}

