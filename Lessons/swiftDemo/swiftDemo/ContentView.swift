//
//  ContentView.swift
//  swiftDemo
//
//  Created by Student on 2026-02-20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Haadiya Will Test This Out")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
