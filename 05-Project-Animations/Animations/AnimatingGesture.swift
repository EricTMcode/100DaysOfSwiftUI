//
//  AnimatingGesture.swift
//  Animations
//
//  Created by Eric on 09/11/2023.
//

import SwiftUI

struct AnimatingGesture: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation(.bouncy) {
                            dragAmount = .zero
                            
                        }
                    }
            )
    }
}

#Preview {
    AnimatingGesture()
}
