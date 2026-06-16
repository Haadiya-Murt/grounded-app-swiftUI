//
//  ContentView.swift
//  diceRoller
//
//  Created by Student on 2026-03-26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numberOfDice: Int = 1
    
    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
                .foregroundStyle(.white)
            
            HStack {
                ForEach(1...numberOfDice, id: \.description) {
                    _ in
                    
                    diceView()
                }
            }
            
            // create buttons to allow user to make as many buttons as they want
            HStack {
                Button("Remove Dice", systemImage:
                        "minus.circle.fill") {
                    withAnimation {
                        numberOfDice -= 1
                    }
                }
                // to avoid going out of range, grey out button when nOD reaches 1
                        .disabled(numberOfDice == 1)
                
                Button("Add Dice", systemImage:
                        "plus.circle.fill") {
                    withAnimation {
                        numberOfDice += 1
                    }
                }
                // to avoid it getting all wonky and squished, just limit the amount of dice to three
                        .disabled(numberOfDice == 5)
            }
            .padding()
            // because text of button is kind of redundant, we can j show the icon (text could be for screen readers)
            .labelStyle(.iconOnly)
            .font(.title)
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appBackground)
        .tint(.white)
        
    }
    
}
    
#Preview {
    ContentView()
    }

