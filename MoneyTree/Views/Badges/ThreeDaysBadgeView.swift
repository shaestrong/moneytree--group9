//
//  ThreeDaysBadgeView.swift
//  MoneyTree
//
//  Created by Shaelyn Strong on 2024-03-21.
//

import SwiftUI

struct ThreeDaysBadgeView: View {
    //var savedForThreeDays: Bool // Indicates whether the user has saved for three days
    
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
                
                VStack {
                    Text("SAVED FOR")
                        .font(.caption)
                        .foregroundColor(.black)
                    Text("3")
                        .font(.system(size: 60, weight: .bold))
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    Text("CONSECUTIVE DAYS")
                        .font(.caption)
                        .foregroundColor(.black)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ThreeDaysBadgeView()
}

