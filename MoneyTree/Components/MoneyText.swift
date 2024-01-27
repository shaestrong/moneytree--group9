//
//  MoneyTextView.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-01-27.
//

import SwiftUI

struct MoneyText: View {
    var amount: Double
    var type: EntryType
    
    var body: some View {
        Text(type == .income ? amount : 0 - amount, format: .currency(code: "CAD")).font(.monospaced(.caption)()).foregroundStyle(type == .income ?
                .green : .red
            )
    }
}

#Preview("Expense") {
    MoneyText(amount: 1.25, type: .expense)
}

#Preview("Income") {
    MoneyText(amount: 2.25, type: .income)
}
