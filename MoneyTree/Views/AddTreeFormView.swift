import SwiftUI

struct AddTreeFormView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Binding var isPresented: Bool
    
    @State private var treeName = ""
    @State private var treeType = ""
    @State private var goalTarget:Double = 0
    @State private var goalDate = Date()
    
    @State var goal: Goal?
    
    var isSaveDisabled: Bool {
        treeName.isEmpty || goalTarget == 0
    }
    
    private func addGoal() {
        if (goal == nil){
            goal = Goal(name: treeName, target: goalTarget, deadline: goalDate)
            modelContext.insert(goal!)
        } else {
            goal!.name = treeName
            goal!.target = goalTarget
            goal!.deadline = goalDate
        }
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text(goal == nil ? "Add Tree" : "Edit Tree")
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 15) {
                    VStack{
                        TextField("Tree Name", text: $treeName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("This will help you remember what your goal is about.")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    //To be added in sprint 2
                    /*TextField("Tree Type", text: $treeType)
                        .textFieldStyle(RoundedBorderTextFieldStyle())*/
                    
                    VStack{
                        TextField("Savings Goal", value: $goalTarget, format: .currency(code: "CAD"))
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("This is the amount of money you want to save. It can be for a toy, a game, or anything else you like!")
                        .foregroundColor(.gray)
                        .font(.caption)
                    }
                    
                    
                    DatePicker("Goal Date", selection: $goalDate, displayedComponents: .date)
                        .datePickerStyle(DefaultDatePickerStyle())
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                }
                .padding(.horizontal, 20)
                
                HStack(spacing: 20) {
                    Button("Cancel") {
                        isPresented = false
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
                    
                    Button(goal == nil ? "Save" : "Update") {
                        addGoal()
                        isPresented = false
                        goal = nil
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isSaveDisabled ? Color.gray : Color.green)
                    .cornerRadius(10)
                    .disabled(isSaveDisabled)
                }
                .padding(.horizontal, 20)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .onAppear {
                if let goal = goal {
                    treeName = goal.name
                    goalTarget = goal.target
                    goalDate = goal.deadline
                }
            }
        }
    }
}

struct AddTreeFormView_Previews: PreviewProvider {
    static var previews: some View {
        AddTreeFormView(isPresented: .constant(true))
    }
}
