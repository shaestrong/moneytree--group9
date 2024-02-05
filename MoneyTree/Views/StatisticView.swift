//
//  StatisticViewA.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-02-04.
//

import SwiftUI

struct StatisticView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        VStack {
                            Text("Income")
                            MoneyText(amount: 9900, type: .income)
                        }
                        
                        VStack {
                            Text("Expense")
                            MoneyText(amount: 9900, type: .expense)
                        }
                        
                    }.card()
                }
            }
        }.navigationTitle("Statistics")
    }
}

#Preview {
    StatisticView()
}
