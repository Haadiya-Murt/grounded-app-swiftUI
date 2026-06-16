//
//  ContentView.swift
//  lists
//
//  Created by Student on 2026-04-01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            let fruits = ["Durian", "Jackfruit", "Dragonfruit", "Pineapple"]
            
            List  {
                ForEach(fruits, id: \.self) {
                    fruit in
                    
                    HStack {
                        Image(systemName: "leaf.fill")
                        Text(fruit)
                            .font(.headline)
                    }
                    .listRowBackground(Color.green.opacity(0.3))
                    .listRowInsets(.init(top: 10, leading: -10, bottom: 10, trailing: 0))
                    .listRowSeparatorTint(.green)
                    .listStyle(.automatic)
                    .padding()
                }
            }
            
            let scores = ["Richard": 40, "Toabean": 90, "Aadya": 100, "Ghazal": 4, "Haadiya": 0]
            
            List {
                ForEach(scores.sorted{$0.value > $1.value}, id: \.key) {
                    name, score in
                    
                    HStack {
                        Text(name)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(score) pts")
                            .foregroundStyle(.blue)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
