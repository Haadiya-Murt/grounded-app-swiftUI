//
//  ContentView.swift
//  BitchassMap
//
//  Created by Student on 2026-05-05.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
		Map(interactionModes: [])
			.mapStyle(.hybrid)
    }
}

#Preview {
    ContentView()
}
