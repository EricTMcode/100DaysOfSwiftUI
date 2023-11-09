//
//  ContentView.swift
//  Animations
//
//  Created by Eric on 07/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmout = 1.0
    
    var body: some View {
        Button("Tap ME") {
            //           animationAmout += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmout)
                .opacity(2 - animationAmout)
                .animation(
                    .easeOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animationAmout)
        )
        .onAppear {
            animationAmout = 2
        }
    }
}

#Preview {
    ContentView()
}
