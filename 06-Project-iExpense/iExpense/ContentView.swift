//
//  ContentView.swift
//  iExpense
//
//  Created by Eric on 10/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    
    
    var body: some View {
        NavigationStack {
            List {
                if !expenses.personalItems.isEmpty {
                    ExpenseSection(title: "Personal", expenses: expenses.personalItems, deleteItems: expenses.removePersonalItems)
                }
                if !expenses.businessItems.isEmpty {
                    ExpenseSection(title: "Business", expenses: expenses.businessItems, deleteItems: expenses.removeBusinessItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
}

#Preview {
    ContentView()
}
