import SwiftUI

class TreeViewModel: ObservableObject {
    @Published var isContentVisible = true
    @Published var isTreeAdded = false
    @Published var treeNames: [String] = []
    @Published var treeGoals: [String] = []
    @Published var isButtonVisible = true
    @Published var isFormVisible = false
    @Published var isFirstSavePressed = false
    @Published var showAlert = false
    @Published var selectedTreeIndex: Int?
}

struct TreeView: View {
    @StateObject private var viewModel = TreeViewModel()
    @State private var isAddTreeFormPresented = false
    
    var body: some View {
        VStack {
            if viewModel.isFirstSavePressed {
                Text("My Money Trees")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
            }
            
            if viewModel.isContentVisible {
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
            } else {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(viewModel.treeNames.indices, id: \.self) { index in
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white)
                                    .shadow(radius: 5)
                                    .frame(width: 150, height: 150)
                                Image(systemName: "tree")
                                    .font(.system(size: 75))
                                    .foregroundColor(.green)
                                    .padding(10)
                                
                                Button(action: {
                                    viewModel.selectedTreeIndex = index
                                    viewModel.showAlert = true
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.red)
                                        .padding(8)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .offset(x: 45, y: -45)
                            }
                            .padding(.bottom, 20)
                            
                            Text(viewModel.treeNames[index])
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding(.bottom, 5)
                            
                            Text(viewModel.treeGoals[index])
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
            }
            
            Spacer()
            
            if viewModel.treeNames.count >= 6 {
                Button(action: {
                    viewModel.showAlert = true
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
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Uh oh!"), message: Text("You're out of trees. Delete one to be able to add another."), dismissButton: .default(Text("OK")))
                }
            } else if viewModel.isButtonVisible {
                Button(action: {
                    isAddTreeFormPresented.toggle()
                    viewModel.isFirstSavePressed = true
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
                .sheet(isPresented: $isAddTreeFormPresented) {
                    AddTreeFormView(isPresented: $isAddTreeFormPresented) { treeName, treeGoal in
                        viewModel.isContentVisible = false
                        viewModel.isTreeAdded = true
                        viewModel.isButtonVisible = true
                        viewModel.isFormVisible = true
                        viewModel.treeNames.append(treeName)
                        viewModel.treeGoals.append(treeGoal)
                    }
                }
            }
        }
        .padding(.top, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            viewModel.isFormVisible ? Color.clear : Color.white
        )
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Delete Tree"), message: Text("Are you sure you want to delete this tree?"), primaryButton: .destructive(Text("Delete")) {
                if let index = viewModel.selectedTreeIndex {
                    viewModel.treeNames.remove(at: index)
                    viewModel.treeGoals.remove(at: index)
                    viewModel.selectedTreeIndex = nil
                }
            }, secondaryButton: .cancel())
        }
    }
}

struct TreeView_Previews: PreviewProvider {
    static var previews: some View {
        TreeView()
    }
}
