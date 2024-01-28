//
//  ContentView.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-01-23.
//

import SwiftUI
import SwiftData
import SectionedQuery

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var items: [Item]
    
    @SectionedQuery(\.day)
    private var sections: SectionedResults<String, Entry>
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationSplitView {
            ScrollView(.horizontal) {
                HStack {
                    GoalProgress()
                    VStack {
                        Text("Add a new goal")
                    }.padding()
                        .card()
                }.padding()
            }.frame(height: 200)
            
            List {
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
                        .onDelete { indexSet in
                            withAnimation {
                                for index in indexSet {
                                    modelContext.delete(section[index])
                                }
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addEntry) {
                        Label("Add Item", systemImage: "plus")
                    }.sheet(isPresented: $showingSheet, content: {
                        NavigationView {
                            EntryCreateView()
                                .navigationTitle("Add")
                                .navigationBarTitleDisplayMode(.inline)
                        }
                        .presentationDetents([.medium])
                    })
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
    
    private func addEntry() {
        showingSheet.toggle()
    }
    //
    //    private func deleteEntries(offsets: IndexSet) {
    //        withAnimation {
    //            for index in offsets {
    //                // modelContext.delete(entries[index])
    //            }
    //        }
    //    }
}

#Preview {
    ContentView()
        .modelContainer(for: Entry.self, inMemory: true)
}
