//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Eric on 19/03/2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker")
                .font(.largeTitle)
            
            Text("Please select a resort from the left-hand menu; swipe from the edge to show it")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
