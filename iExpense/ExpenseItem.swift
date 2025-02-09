//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Amid Mamedov on 09.02.2025.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
