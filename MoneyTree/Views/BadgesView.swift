//
//  BadgesView.swift
//  MoneyTree
//
//  Created by Stephany Ceron on 27/03/24.
//

import SwiftUI
import SwiftData

struct BadgesView: View {
    @State var viewModel:BadgesViewModel
    @Query private var goals: [Goal]
    
    var body: some View {
        VStack {
            ForEach(viewModel.listEarnedBadges){ badge in
                badge.view
            }
        }
        .onAppear {
            viewModel.checkAchievements(goals: goals)
        }
    }
}

struct BadgesView_Previews: PreviewProvider {
    static var previews: some View {
        let sharedModelContainer: ModelContainer = {
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
        return BadgesView(viewModel: BadgesViewModel())
            .modelContainer(sharedModelContainer)
    }
}
