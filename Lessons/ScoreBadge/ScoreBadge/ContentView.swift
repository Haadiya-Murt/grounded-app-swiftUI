//
//  ContentView.swift
//  ScoreBadge
//
//  Created by Ashley McCallum on 2026-03-24.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreText = ""
    @State private var message = "Enter a score to begin"
    @State private var badgeColor: Color = .gray
    @State private var badgeLabel = "Ready"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Score Badge")
                .font(.largeTitle)
                .bold()
            
            Circle()
                .fill(badgeColor)
                .frame(width: 140, height: 140)
                .shadow(radius: 6)
                .overlay(
                    Text(badgeLabel)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                )
                .animation(.easeInOut, value: badgeColor)
            
            VStack(spacing: 12) {
                TextField("Score (0-100)", text: $scoreText)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .frame(maxWidth: 240)
                    .onChange(of: scoreText) {
                        newValue in
                        
                        let score = Int(newValue) ?? -1
                        
                        if score < 0 || score > 100 {
                            message = "Please enter a valid number from 0 - 100"
                            badgeColor = .gray
                            badgeLabel = "Ready"
                        } else if score == 100 {
                            message = "Perfect Score!"
                            badgeColor = .green
                            badgeLabel = "Perfect!"
                        } else if score >= 90 {
                            message = "A - Excellent Work!"
                            badgeColor = .green
                            badgeLabel = "A"
                        } else if score >= 75 {
                            message = "B - Great Job!"
                            badgeColor = .mint
                            badgeLabel = "B"
                        } else if score >= 60 {
                            message = "C - Good Work"
                            badgeColor = .yellow
                            badgeLabel = "C"
                        } else if score >= 50 {
                            message = "D - Keep Trying"
                            badgeColor = .orange
                            badgeLabel = "D"
                        } else {
                            message = "F - Better luck next time"
                            badgeColor = .red
                            badgeLabel = "F"
                        }
                    }
                
                Text(message)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
