import SwiftUI

class TreeViewModel: ObservableObject {
    @Published var isContentVisible = true
    @Published var isTreeAdded = false
    @Published var treeName = ""
    @Published var isButtonVisible = true
    @Published var isPlusVisible = false
}

struct TreeView: View {
    @StateObject private var viewModel = TreeViewModel()
    @State private var isAddTreeFormPresented = false
    
    var body: some View {
        VStack {
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
                EmptyView()
            }
            
            if viewModel.isTreeAdded {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .shadow(radius: 5)
                            .frame(width: 150, height: 150)
                        Image(systemName: "tree")
                            .font(.system(size: 75))
                            .foregroundColor(.green)
                    }
                    .padding(.bottom, 20)
                    
                    Text(viewModel.treeName)
                        .font(.headline)
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            if viewModel.isButtonVisible {
                Button(action: {
                    isAddTreeFormPresented.toggle()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 24))
                        Text("Add Tree")
                            .font(.headline)
                    }
                    .padding()
                    .foregroundColor(.green)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 3)
                }
                .padding(.bottom, 20)
                .sheet(isPresented: $isAddTreeFormPresented) {
                    AddTreeFormView(isPresented: $isAddTreeFormPresented) {
                        viewModel.isContentVisible = false
                        viewModel.isTreeAdded = true
                        viewModel.isButtonVisible = false
                        viewModel.isPlusVisible = true // Set to true when a tree is added
                    }
                }
            }
        }
        .padding(.top, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            viewModel.isPlusVisible ? Color.clear : Color.white
        )
        
        if viewModel.isPlusVisible {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.green)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct TreeView_Previews: PreviewProvider {
    static var previews: some View {
        TreeView()
    }
}
