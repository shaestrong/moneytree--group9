//
//  ContentView.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-01-23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var viewModel:BadgesViewModel
    
    var body: some View {
            TabView {
                MainView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                StatisticView(month: Date.now)
                    .tabItem {
                        Label("Statistics", systemImage: "chart.bar.xaxis")
                    }
                TreeView()
                    .tabItem {
                        Label("Trees", systemImage: "tree")
                    }
                BadgesView(viewModel: viewModel)
                    .tabItem {
                        Label("Achievements", systemImage: "trophy")
                    }
            }
    }
}

#Preview {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Entry.self,
            Goal.self
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
   return ContentView(viewModel: BadgesViewModel())
        .modelContainer(sharedModelContainer)
}
