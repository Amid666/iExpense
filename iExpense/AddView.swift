//
//  AddView.swift
//  iExpense
//
//  Created by Amid Mamedov on 09.02.2025.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss)
    var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0
    
    var expenses: Expenses
    
    let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expanse")
            .toolbar {
                Button {
                    let item = ExpenseItem(name: name, type: type, amount: Double(amount))
                    expenses.items.append(item)
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
