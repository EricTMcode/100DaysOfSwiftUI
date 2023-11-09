//
//  AnimatingBinding.swift
//  Animations
//
//  Created by Eric on 09/11/2023.
//

import SwiftUI

struct AnimatingBinding: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        print(animationAmount)
        
       return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        }
        .padding()
    }
}

#Preview {
    AnimatingBinding()
}
