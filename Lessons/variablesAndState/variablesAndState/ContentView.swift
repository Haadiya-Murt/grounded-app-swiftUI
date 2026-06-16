//
//  ContentView.swift
//  variablesAndState
//
//  Created by Student on 2026-03-04.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 20) {
           Text("Count: \(count)")
                .font(.title)
            HStack {
                Button("Add 1") {
                    count += 1
                }
                .buttonStyle(.borderedProminent)
                
                
                Button("Reset") {
                    count = 0
                    
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
