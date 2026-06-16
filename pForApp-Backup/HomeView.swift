//
//  HomeView.swift
//  practicingForApp
//
//  Created by Student on 2026-04-18.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
		TabView {
			GardenView()
				.tabItem{
					Label("Your Garden", systemImage: "leaf")
				}
			MapView()
				.tabItem {
					Label("Map", systemImage: "location.fill")
				}
			SettingsPage()
				.tabItem{
					Label("Settings", systemImage: "gear")
				}
		}

	}
}

#Preview {
    HomeView()
}
