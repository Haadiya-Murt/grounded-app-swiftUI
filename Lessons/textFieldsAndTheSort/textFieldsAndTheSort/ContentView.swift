//
//  ContentView.swift
//  textFieldsAndTheSort
//
//  Created by Student on 2026-03-05.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var password = ""
    @State private var bio = "bio here"
    
    var body: some View {
        VStack(spacing:20) {
            Text("Your name: \(name)")
            TextField("Enter your name", text: $name)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.characters)
            
            Text("Your password: \(password)")
            SecureField("Enter password", text: $password)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .onSubmit {
        
                }
            
            TextField("Enter your name again", text: $name)
                .font(.title3)
                .foregroundStyle(.purple)
                .padding()
                .background(.gray.opacity(0.2))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.blue, lineWidth:2))
            
            TextEditor(text: $bio)
                .border(.red)

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
