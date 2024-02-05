//
//  ContentView.swift
//  MoneyTree
//
//  Created by Stanley Cao on 2024-01-23.
//

import SwiftUI
import SwiftData
import SectionedQuery

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var items: [Item]
    
    @SectionedQuery(\.day)
    private var sections: SectionedResults<String, Entry>
    
    @State private var showingSheet = false
    
    private var cardWidth = UIScreen.main.bounds.size.width / 2 - 24
    
    var body: some View {
        NavigationStack {
            List {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: 16) {
                        GoalProgress()
                            .frame(width: cardWidth, height: 150)
                        // start of add
                        VStack (spacing: 8) {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                            Text("Add a new goal")
                                .foregroundColor(.accentColor)
                                .fontWeight(.medium)
                        }
                        .padding()
                        .frame(width: cardWidth, height: 150)
                        .card()
                        // end of add
                    }
                }
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowBackground(Color.clear)
                
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
            .navigationTitle("Spendings")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addEntry) {
                        Label("Add Item", systemImage: "plus")
                    }.sheet(isPresented: $showingSheet, content: {
                        NavigationView {
                            EntryEditorView()
                                .navigationBarTitleDisplayMode(.inline)
                        }
                        .presentationDetents([.medium])
                    })
                }
            }
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
    MainView()
        .modelContainer(for: Entry.self, inMemory: true)
}
