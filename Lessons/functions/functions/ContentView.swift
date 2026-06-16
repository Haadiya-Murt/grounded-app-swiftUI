//
//  ContentView.swift
//  functions
//
//  Created by Student on 2026-03-25.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    @State private var pastedText = ""
    
    var body: some View {
        VStack {
            Text("You tapped: \(counter)")
            
            Button("Tap") {
                print("This button was tapped!")
                counter += 1
                multiplyCounter(number: counter)
            }
            .buttonStyle(.bordered)
            .tint(.green)
            
            Button {
                counter = 0
            } label: {
                Text("Reset")
                    .padding()
                    .background(.red)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
                    .font(.custom("Impact", size: 30))
            }
            
            Button("Say hello", action: sayHello)
            
            Button("Say hello again") {
                sayHello()
            }
            
            Divider()
            
            Link("Go to Google", destination: URL(string: "https://www.google.com")!)
                .foregroundStyle(.pink)
                .underline()
                .font(.custom("Marker Felt", size: 20))
            
            Divider()
            
            TextField("Paste here", text: $pastedText)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            PasteButton(payloadType: String.self) {
                strings in
                
                pastedText = strings.joined(separator: " ")
            }
        }
        .padding()
    }
    
    func multiplyCounter(number: Int) {
        print("\(number) * 2 = \(number * 2)")
    }
    
    // not a UI element so it should be outside of the stack/var body
    func sayHello() {
        print("Hello.")
    }
}

#Preview {
    ContentView()
}
