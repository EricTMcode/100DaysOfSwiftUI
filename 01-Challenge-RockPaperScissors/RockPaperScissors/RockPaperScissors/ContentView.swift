//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Eric on 01/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    let moves = ["🪨", "📄", "✂️"]
    let winningMoves = ["📄", "✂️", "🪨"]
    
    @State private var randomMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var questionCounter = 1
    @State private var showinResults = false
    
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            Text("Rock Paper Scissors")
                .font(.largeTitle.bold())
            
            Text(moves[randomMove])
                .font(.system(size: 130))
            
            
            HStack {
                ForEach(0..<3) { number in
                    Button {
                        play(moves[number])
                    } label: {
                        Text(moves[number])
                            .font(.system(size: 80))
                    }
                }
            }
            Text("Score: \(score)")
                .font(.title)
            
            Spacer()
        }
        .alert("Game Over", isPresented: $showinResults) {
            Button("Start Again", action: newGame)
        } message: {
            Text("Your score was \(score)")
        }
    }
    
    func play(_ moves: String) {
        if moves == winningMoves[randomMove] {
            score += 1
        } else {
            if score > 0 {
                score -= 1
            }
        }
        
        if questionCounter == 10 {
            showinResults = true
        }
        
        newTurn()
    }
    
    func newTurn() {
        randomMove = Int.random(in: 0...2)
        questionCounter += 1
    }
    
    func newGame() {
        questionCounter = 1
        score = 0
        randomMove = Int.random(in: 0...2)
        newTurn()
    }
}

#Preview {
    ContentView()
}
