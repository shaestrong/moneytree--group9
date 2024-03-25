import SwiftUI
import SwiftData
import Lottie

struct TreeView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var showTreeForm = false
    @State private var showMaxAlert = false
    @State private var showDeleteAlert = false
    @State private var selectedTree: Goal?
    
    @Query private var goals: [Goal]
    
    private func getImageTree(goal: Goal) -> some View {
        switch goal.progress {
        case 0..<0.4:
            return LottieView(animation: .named("Planting-1"))
                .currentProgress(1)
                .frame(maxHeight: 100)
        case 0.4..<0.7:
            return LottieView(animation: .named("Planting-2"))
                .currentProgress(1)
                .frame(maxHeight: 100)
        case 0.7..<1:
            return LottieView(animation: .named("Planting-3"))
                .currentProgress(1)
                .frame(maxHeight: 100)
        case 1...:
            return LottieView(animation: .named("Planting-4"))
                .currentProgress(1)
                .frame(maxHeight: 100)
        default:
            return LottieView(animation: .named("Planting-1"))
                .currentProgress(1)
                .frame(maxHeight: 100)
        }
    }
    
    var body: some View {
        VStack {
            if !goals.isEmpty {
                Text("My Money Trees")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(goals) { goal in
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white)
                                    .shadow(radius: 5)
                                    .frame(width: 150, height: 150)
                                getImageTree(goal: goal)
                                    .id("\(Date())")
                                
                                Button(action: {
                                    selectedTree = goal
                                    showDeleteAlert = true
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.red)
                                        .padding(8)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .offset(x: 45, y: -45)
                            }
                            .padding(.bottom, 20)
                            
                            Text(goal.name)
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding(.bottom, 5)
                                .lineLimit(1)
                            
                            Text("$\(goal.target, specifier: "%.2f")")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
            } else {
                ZStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 150, height: 150)
                    Image(systemName: "tree")
                        .font(.system(size: 75))
                        .foregroundColor(.white)
                }
                .padding(.top, 20)
                .padding(.bottom, 30)
                
                Text("Plant a MoneyTree")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                Text("Set your savings goal and")
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                
                Text("watch your MoneyTree grow!")
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
            }
            
            Spacer()
            
            if goals.count >= 6 {
                Button(action: {
                    showMaxAlert.toggle()
                }) {
                    Text("Add Tree")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.green)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
                .padding(.bottom, 20)
                .alert(isPresented: $showMaxAlert) {
                    Alert(title: Text("Uh oh!"), message: Text("You're out of trees. Delete one to be able to add another."), dismissButton: .default(Text("OK")))
                }
            } else {
                Button(action: {
                    showTreeForm.toggle()
                }) {
                    Text("Add Tree")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.green)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                }
                .padding(.bottom, 20)
                .sheet(isPresented: $showTreeForm) {
                    AddTreeFormView(isPresented: $showTreeForm)
                }
            }
        }
        .padding(.top, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .alert(isPresented: $showDeleteAlert) {
            Alert(title: Text("Delete Tree"), message: Text("Are you sure you want to delete this tree?"), primaryButton: .destructive(Text("Delete")) {
                if let goal = selectedTree {
                    modelContext.delete(goal)
                }
            }, secondaryButton: .cancel())
        }
    }
}

struct TreeView_Previews: PreviewProvider {
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
        
        return TreeView()
            .modelContainer(sharedModelContainer)
    }
}

