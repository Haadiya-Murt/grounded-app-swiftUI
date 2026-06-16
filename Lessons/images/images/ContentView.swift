//
//  ContentView.swift
//  images
//
//  Created by Student on 2026-03-10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("flower")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 300, height: 300)
                .shadow(radius: 5)
            
            AsyncImage(url: URL(string: "https://picsum.photos/300/300")) {
                image in
                
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                
            } placeholder: {
                ProgressView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
