//
//  ContentView.swift
//  weatherForecast
//
//  Created by Student on 2026-02-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack (spacing: 20){
            DayForecast(day: "Mon", isRainy: false, high: 70, low: 50)
            DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)

        }
    }
}

struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        if isRainy {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconColour: Color {
        if isRainy {
            return Color.blue
        } else {
            return Color.yellow
        }
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(.headline)
            Image(systemName: iconName)
                .foregroundStyle(iconColour)
                .font(.largeTitle)
                .padding(5)
            Text("High: \(high)º")
                .fontWeight(.semibold)
            Text("Low: \(low)º")
                .fontWeight(.medium)
                .foregroundStyle(Color.secondary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
