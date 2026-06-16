//
//  ContentView.swift
//  LoveChris
//
//  Created by Student on 2026-02-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
                
                Image("aadya")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                               
                HStack {
                    Text("Hello, world! \nThis is Haadiya")
                        .font(.title)
                        .bold()
                        
                    Spacer()
                        
                    VStack {
                        HStack {
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.leadinghalf.filled")
                            
                        }
                        Text("(Review 361)")
                    }
                    .foregroundStyle(.orange)
                    .font(.caption)
                        
                }
                Text("Haadiya loves it")
                               
                HStack {
                    Spacer()
                    Image(systemName: "fork.knife")
                    Image(systemName: "binocular.fill")
                }
                .foregroundStyle(.black)
                .font(.caption)
            }
            .padding()
            .background() {
                Rectangle()
                    .foregroundStyle(.teal)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(radius:18)
        }
            .padding(insets:EdgeInsets)
    }
}

#Preview {
    ContentView()
}
