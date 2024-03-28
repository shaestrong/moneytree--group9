import SwiftUI
import SwiftData

struct BadgesView: View {
    @State var viewModel: BadgesViewModel
    @Query private var goals: [Goal]
    
    var body: some View {
        VStack {
            Text("Achievements")
                .font(.title)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(viewModel.listEarnedBadges) { badge in
                        badge.view
                    }
                }
                
                .padding(.horizontal)
            }
            Spacer()
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
