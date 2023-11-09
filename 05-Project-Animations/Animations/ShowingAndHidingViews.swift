//
//  ShowingAndHidingViews.swift
//  Animations
//
//  Created by Eric on 09/11/2023.
//

import SwiftUI

struct ShowingAndHidingViews: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

#Preview {
    ShowingAndHidingViews()
}
