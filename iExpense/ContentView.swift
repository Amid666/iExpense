//
//  ContentView.swift
//  iExpense
//
//  Created by Amid Mamedov on 09.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var isShowingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    isShowingAddExpense = true
                }
            }
            .sheet(isPresented: $isShowingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    private func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
