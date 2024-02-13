import SwiftUI

struct AddTreeFormView: View {
    @Binding var isPresented: Bool
    var onSave: (String, String) -> Void
    
    @State private var treeName = ""
    @State private var treeType = ""
    @State private var goal = ""
    @State private var goalDate = Date()
    
    var isSaveDisabled: Bool {
        treeName.isEmpty || goal.isEmpty
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Add Tree")
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 15) {
                    TextField("Tree Name", text: $treeName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Tree Type", text: $treeType)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Savings Goal", text: $goal)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
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
                    
                    Button("Save") {
                        onSave(treeName, goal)
                        isPresented = false
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
        }
    }
}

struct AddTreeFormView_Previews: PreviewProvider {
    static var previews: some View {
        AddTreeFormView(isPresented: .constant(true), onSave: { _, _ in })
    }
}
