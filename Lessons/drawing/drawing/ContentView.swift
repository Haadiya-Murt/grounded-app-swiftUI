//
//  ContentView.swift
//  drawing
//
//  Created by Student on 2026-02-27.
//

import SwiftUI
import PaperKit
import PencilKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
