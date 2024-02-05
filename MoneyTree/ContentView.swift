//
//  ContentView.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-01-23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            StatisticView(month: Date.now)
                .tabItem {
                    Label("Statistic", systemImage: "chart.bar.xaxis")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Entry.self, inMemory: true)
}
