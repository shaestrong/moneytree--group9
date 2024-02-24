//
//  GoalDetailView.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-02-14.
//

import SwiftUI
import Lottie
import SwiftData
import SectionedQuery

struct GoalDetailView: View {
    
    @Bindable var goal: Goal
    
    @Environment(\.modelContext) private var modelContext
    
    @SectionedQuery<String, Entry>
    private var sections: SectionedResults<String, Entry>
    
    private func getMotivationString () -> String {
        switch true {
        case goal.progress < 0.4:
            return "You can do it!"
        case goal.progress < 0.7:
            return "You are doing great!"
        case goal.progress < 1:
            return "Almost there"
        default:
            return "Congratulations!"
        }
    }
    
    
    init (goal: Goal) {
        self.goal = goal
        let id = goal.persistentModelID
        let filter = #Predicate<Entry> { entry in
            entry.goal?.persistentModelID == id
        }
        
        _sections = SectionedQuery(\.day, filter: filter,
                                    sort: [SortDescriptor(\.date, order: .reverse)])
    }
    
    private var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: goal.deadline)
    }
    
    var body: some View {
        
        let fCurrent = goal.current.formatted(.currency(code: "CAD"))
        let fTarget = goal.target.formatted(.currency(code: "CAD"))
        
        return GeometryReader { geometry in
            List {
                Section {
                    VStack (alignment: .center) {
                        LottieView(animation: .named("Planting-1"))
                            .looping()
                            .frame(width: geometry.size.width / 2)
                            .padding(.bottom, 48)
                        
                        Text(goal.name)
                            .font(.title2)
                            .fontWeight(.black)
                            .padding(.bottom, 4)
                        
                        HStack (alignment: .center, spacing: 4) {
                            Image(systemName: "clock")
                                .font(.subheadline)
                                .fontWeight(.medium)
                            Text(formattedDate)
                                .font(.subheadline)
                                .fontWeight(.medium)
                        }.padding(.bottom, 24)
                        
                        
                        
                        VStack (alignment: .center) {
                            Text(getMotivationString()).font(.headline)
                                .padding(.bottom, 4)
                            
                            
                            ProgressView(value: goal.progress)
                                .progressViewStyle(RoundedRectProgressViewStyle())
                                .overlay {
                                    Text("\(fCurrent) of \(fTarget)")
                                        .foregroundColor(.white)
                                        .font(.caption2)
                                        .fontWeight(.bold)
                                }
                            
                        }
                        .padding()
                        .cornerRadius(12)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.green)
                                .opacity(0.2)
                        }
                        .padding()
                    }
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                
                ForEach(sections) { section in
                    Section(header: Text(section.id)) {
                        ForEach(section) { item in
                            NavigationLink {
                                EntryDetailView(entry: item)
                            } label: {
                                VStack(alignment: .leading, spacing: 3) {
                                    Text(item.name)
                                    MoneyText(amount: item.amount, type: item.entryType)
                                }
                            }
                        }
                    }
                }
            }
        }.navigationTitle(goal.name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    GoalDetailView(goal: Goal(name: "Test Goal long long long", target: 100, deadline: Date()))
}
