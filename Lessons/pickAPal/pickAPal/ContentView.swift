//
//  ContentView.swift
//  pickAPal
//
//  Created by Student on 2026-04-02.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = []
    @State private var nameToAdd = ""
    @State private var selectedName = ""
    @State private var shouldRemoveSelectedName = false
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            
            Text(selectedName.isEmpty ? " " : selectedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            
            List {
                ForEach (names, id: \.description) {
                    name in
                    
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            TextField("Add Name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            
            Divider ()
            
            Toggle("Remove when picked", isOn: $shouldRemoveSelectedName)
            
            Button {
                if let randomName = names.randomElement() {
                    selectedName = randomName
                    
                    if shouldRemoveSelectedName {
                        names.removeAll {
                            name in
                            return (name == randomName)
                        }
                    }
                } else {
                    selectedName = ""
                }
            } label: {
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
