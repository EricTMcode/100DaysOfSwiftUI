//
//  Activity.swift
//  Habito
//
//  Created by Eric on 11/01/2024.
//

import Foundation

struct Activity: Codable, Equatable, Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount = 0
    
    static let example = Activity(title: "Example activity", description: "This is a test activity")
}
