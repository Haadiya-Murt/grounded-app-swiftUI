//
//  ContentView.swift
//  chatGPT
//
//  Created by Student on 2026-02-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TravelCardView(destination: TravelDestination())
    }
}
struct TravelDestination: Identifiable {
    let id = UUID();
    let name: String="Haadiya";
    let country: String="Laos";
    let imageName = "bitch";
    let rating: Double=3.46;
    let price: Int=327;
}

struct TravelCardView: View {
    
    let destination: TravelDestination
    @State private var isPressed = false
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            
            // Background Image
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 260)
                .clipped()
            
            // Gradient Overlay
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.black.opacity(0.0),
                    Color.black.opacity(0.7)
                ]),
                startPoint: .center,
                endPoint: .bottom
            )
            
            // Content
            VStack(alignment: .leading, spacing: 8) {
                
                Spacer()
                
                // Location
                Text(destination.name)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                
                Text(destination.country)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.85))
                
                HStack {
                    // Rating
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(String(format: "%.1f", destination.rating))
                            .foregroundColor(.white)
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    // Price
                    Text("$\(destination.price)")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                    
                    Text("/night")
                        .foregroundColor(.white.opacity(0.8))
                        .font(.caption)
                }
            }
            .padding()
        }
        .frame(height: 260)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.25), radius: 10, x: 0, y: 8)
        .scaleEffect(isPressed ? 0.97 : 1.0)
        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isPressed)
        .onTapGesture {
            isPressed.toggle()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                isPressed = false
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    TravelCardView(destination: TravelDestination())
}
