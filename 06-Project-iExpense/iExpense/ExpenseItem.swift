//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Eric on 10/11/2023.
//

import Foundation

struct ExpenseItem: Codable, Equatable, Identifiable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
