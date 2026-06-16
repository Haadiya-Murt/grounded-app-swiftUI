//
//  ContentView.swift
//  stackLesson
//
//  Created by Student on 2026-02-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.brown
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .frame(width:300, height:180)
            
            VStack(alignment: .leading, spacing: 25) {
                Text("Name:")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.pink)
                //.multilineTextAlignment(.center)
                
                let name="Haadiya" // immutable
                
                HStack(spacing: 50) {
                    Text(name)
                        .kerning(5)
                    Text("Murtaza")
                }
                
                let age=28 // mutable
                
                Text("I am \(age) years old.")
                
                Text("This is a longer message that may span multiple lines depending on the screen")
                    .lineLimit(1)
                
                Label("Settings", systemImage: "gear")
                    .font(.headline)
                    .foregroundStyle(.pink)
                
                Label{
                    Text("Downloads")
                        .font(.title3)
                        .foregroundColor(.pink)
                } icon: {
                    Image("tree")
                        .resizable()
                        .frame(width: 50, height:50)
                }
                
            }
            //.offset(x: 0, y: 50)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
