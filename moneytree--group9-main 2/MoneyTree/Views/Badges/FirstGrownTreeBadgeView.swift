//
//  FirstGrownTreeBadge.swift
//  MoneyTree
//
//  Created by Shaelyn Strong on 2024-03-24.
//

import SwiftUI

struct FirstGrownTreeBadgeView: View {
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
                Image(systemName: "tree")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding(.horizontal)
                    .padding(.top, 20)
                    .padding(.bottom, 2)
                
                    .foregroundColor(.green)
                
                Text("Grew a\nTree")
                    .font(.system(size: 10))
                    .bold()
                    .foregroundColor(.black)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 15)
                    .multilineTextAlignment(.center)
                
            }
        }
        .padding()
        .background(Color.clear)
    }
}

#Preview {
    FirstGrownTreeBadgeView()
}
