//
//  String-EmptyChecking.swift
//  Cupcake Corner
//
//  Created by Eric on 14/01/2024.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
