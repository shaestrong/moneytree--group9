//
//  FirstGoalBadgeView.swift
//  MoneyTree
//
//  Created by Shaelyn Strong on 2024-03-21.
//

import SwiftUI

struct FirstTreeBadgeView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.yellow.opacity(0.5))
                .frame(width: 80, height: 80)
                .overlay(
                    Circle()
                        .stroke(Color.yellow, lineWidth: 3)
                )
            
            VStack {
                Image(systemName: "leaf")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom, 2)
                
                    .foregroundColor(.green)
                
                Text("Planted a\nTree")
                    .font(.system(size: 10))
                    .bold()
                    .foregroundColor(.black)
                    .padding(.bottom)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
            }
        }
        .padding()
        .background(Color.clear)
    }
}

#Preview {
    FirstTreeBadgeView()
}
