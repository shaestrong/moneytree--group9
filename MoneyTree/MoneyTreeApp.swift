//
//  MoneyTreeApp.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-01-23.
//

import SwiftUI
import SwiftData

@main
struct MoneyTreeApp: App {
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

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: BadgesViewModel())
        }
        .modelContainer(sharedModelContainer)
    }
}
