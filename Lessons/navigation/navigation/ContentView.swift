//
//  ContentView.swift
//  navigation
//
//  Created by Student on 2026-04-13.
//

import SwiftUI

struct ContentView: View {
	@State private var username = ""
	
    var body: some View {
		TabView {
			NavigationStack {
				HomeView(username: $username)
			}
				.tabItem{
					Label("Home", systemImage: "house.fill")
				}
			SettingsView(username: $username)
				.tabItem{
					Label("Settings", systemImage: "gear")
				}
				
		}
    }
}

#Preview {
    ContentView()
}
