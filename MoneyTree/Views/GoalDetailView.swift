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
        GeometryReader { geometry in
            List {
                Section {
                    VStack (alignment: .center) {
                        LottieView(animation: .named("Planting"))
                            .looping()
                            .frame(width: geometry.size.width / 2)
                            .padding(.bottom, 48)
                        
                        Text(goal.name)
                            .font(.title)
                            .fontWeight(.medium)
                            .padding(.bottom, 4)
                        
                        HStack (alignment: .center, spacing: 4) {
                            Image(systemName: "clock")
                                .font(.callout)
                            Text(formattedDate)
                                .font(.callout)
                        }.padding(.bottom, 24)
                        
                        VStack (alignment: .center) {
                            Text("Keep it up!").font(.headline)
                                .padding(.bottom, 4)
                            ProgressView(value: goal.progress)
                                .progressViewStyle(RoundedRectProgressViewStyle())
                            
                        }
                        .padding()
                        .cornerRadius(12)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.green)
                                .opacity(0.2)
                        }
                    }
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowBackground(Color.clear)
                    
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
    GoalDetailView(goal: Goal(name: "Test Goal", target: 100, deadline: Date()))
}
