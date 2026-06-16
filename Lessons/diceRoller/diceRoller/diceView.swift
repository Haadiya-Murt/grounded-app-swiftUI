//
//  diceView.swift
//  diceRoller
//
//  Created by Student on 2026-03-26.
//

import SwiftUI

struct diceView: View {
    @State private var numberOfPips: Int = 1
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
                // instead of hardcoding the dimensions, set it to a maximum width and height to allow for more flexibility
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.black, .white)
            
            Button("Roll") {
                withAnimation {
                    numberOfPips = Int.random(in: 1...6)
                }
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    diceView()
}
