//
//  TipsView.swift
//  MoneyTree
//
//  Created by Stephany Ceron on 4/03/24.
//

import SwiftUI

struct TipsView: View {
    var body: some View {
        Section {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .font(.title)
                    .foregroundColor(.yellow)
                
                VStack (alignment: .leading){
                    Text("Smart Sprouts!")
                        .font(.title3)
                        .fontWeight(.black)
                        .foregroundStyle(.customGreen)
                    
                    Text(Tips.getRandomTip())
                        .foregroundStyle(.customGreen)
                        .font(.footnote)
                }
                Spacer()
            }
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 10)
               .fill(Color.green.opacity(0.1))
               .strokeBorder(Color.customGreen, lineWidth: 1)
        )
       .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

#Preview {
    TipsView()
}
