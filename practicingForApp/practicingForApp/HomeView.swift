//
//  HomeView.swift
//  practicingForApp
//
//  Created by Student on 2026-04-18.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    var body: some View {
		TabView {
			GardenView()
				.tabItem{
					Label("Your Garden", systemImage: "leaf")
				}
			AccLocationView()
				.tabItem {
					Label("Map", systemImage: "location.fill")
				}
			SettingsPage()
				.tabItem{
					Label("Settings", systemImage: "gear")
				}
		}
	//	.modelContainer(for: UserPlant.self)

	}
}

#Preview {
    HomeView()
		.modelContainer(for: UserPlant.self, inMemory: true)
}
