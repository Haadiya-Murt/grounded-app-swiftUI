//
//  ContentView.swift
//  visualElements
//
//  Created by Student on 2026-03-11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // create a full screen background with a gradient
            LinearGradient(colors:[.yellow, .orange, .red, .pink], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                ZStack {
                    UnevenRoundedRectangle(topLeadingRadius: 100, bottomLeadingRadius: 0, bottomTrailingRadius: 100, topTrailingRadius: 0)
                        .foregroundStyle(.white)
                    Text("My Shape App")
                        .font(.custom("Futura", size: 30))
                        .bold()
                    // makes the text gradient
                        .foregroundStyle(LinearGradient(colors:[.purple, .indigo, .blue], startPoint: .leading, endPoint: .trailing))
                        .padding()
                }
                
                Divider()
                
                HStack(spacing: 20) {
                    VStack(spacing: -5) {
                        ZStack {
                            Circle()
                                .foregroundStyle(.white)
                                .frame(width: 20, height: 20)
                            HStack(spacing: 2) {
                                Circle()
                                    .frame(width: 5, height: 5)
                                Circle()
                                    .frame(width: 5, height: 5)
                            }
                        }
                        
                        ZStack {
                            Circle()
                                .foregroundStyle(.white)
                                .frame(width: 30, height: 30)
                            VStack(spacing: 2) {
                                Circle()
                                    .frame(width: 5, height: 5)
                                Circle()
                                    .frame(width: 5, height: 5)
                                Circle()
                                    .frame(width: 5, height: 5)
                            }
                            .foregroundStyle(.red)
                        }
                        
                        Circle()
                            .foregroundStyle(Color.white)
                            .frame(width: 40, height: 40)
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(EllipticalGradient(colors: [.cyan, .blue, .cyan, .blue]))
                        Text("\u{2198} a cool snowman")
                            .font(.custom("Rockwell", size: 25))
                            .bold()
                    }
                }
                
                HStack {
                    Capsule()
                        .foregroundStyle(AngularGradient(colors: [.green, .teal, .green, .yellow], center: .center))
                    Capsule()
                        .foregroundStyle(LinearGradient(colors: [.pink, .purple, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
                }
                ZStack {
                    Ellipse()
                        .foregroundStyle(.yellow.opacity(0.5))
                    Ellipse()
                        .foregroundStyle(.yellow.opacity(0.5))
                        .rotationEffect(.degrees(20))
                    Ellipse()
                        .foregroundStyle(.yellow.opacity(0.5))
                        .rotationEffect(.degrees(40))
                    Ellipse()
                        .foregroundStyle(.yellow.opacity(0.5))
                        .rotationEffect(.degrees(60))
                    Ellipse()
                        .foregroundStyle(.yellow.opacity(0.5))
                        .rotationEffect(.degrees(80))
                    Ellipse()
                        .foregroundStyle(.yellow.opacity(0.5))
                        .rotationEffect(.degrees(100))
                    Ellipse()
                        .foregroundStyle(.yellow.opacity(0.5))
                        .rotationEffect(.degrees(120))
                    Ellipse()
                        .foregroundStyle(.yellow.opacity(0.5))
                        .rotationEffect(.degrees(140))
                    Ellipse()
                        .foregroundStyle(.yellow.opacity(0.5))
                        .rotationEffect(.degrees(160))
                    Circle()
                        .foregroundStyle(RadialGradient(colors: [.teal, .green, .yellow, .pink], center: .center, startRadius: 0, endRadius: 50))
                        .frame(width: 100, height: 100)
                    
                }
                .padding(.vertical, 100)
                
                ZStack {
                    RotatedShape(shape: Rectangle(), angle: .degrees(5))
                    Rectangle()
                        .foregroundStyle(.white)
                    
                    VStack(spacing: 5) {
                        Text("A Stacked Effect")
                            .font(.custom("Marker Felt", size: 25))
                            .foregroundStyle(.gray)
                        
                        Rectangle()
                            .frame(width: 150, height: 5)
                            .foregroundStyle(.cyan)
                    }
                }
            }
            .padding(30)
        }
    }
}

#Preview {
    ContentView()
}
