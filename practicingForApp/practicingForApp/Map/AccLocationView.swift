//
//  AccLocationView.swift
//  practicingForApp
//
//  Created by Student on 2026-06-04.
//

import SwiftUI
import MapKit

struct PlantStoreListView: View {
	@ObservedObject var searchManager: PlantSearchManager
	
	var body: some View {
		VStack(alignment: .leading) {
			Text("Nearby Shops")
				.font(.custom("ChakraPetch-Bold", size: 22))
				.foregroundStyle(.yellingYellows)
				.padding(.horizontal)
			
			if searchManager.places.isEmpty {
				ContentUnavailableView(
					"No Stores Loaded",
					systemImage: "storefront",
					description: Text("Tap the buttons to find local plant shops.")
				)
				.foregroundStyle(.yellingYellows)
				.opacity(0.6)
			} else {
				List(searchManager.places, id: \.self) { place in
					VStack(alignment: .leading, spacing: 4) {
						Text(place.name ?? "Unknown Shop")
							.font(.custom("JetBrainsMono-Bold", size: 16))
							.foregroundStyle(.yellingYellows)
						
						Text(place.placemark.title ?? "")
							.font(.custom("JetBrainsMono-Regular", size: 12))
							.foregroundStyle(.white.opacity(0.8))
					}
					.listRowBackground(Color.relativelyDeeperPink)
				}
				.scrollContentBackground(.hidden)
			}
		}
		.padding(.top)
	}
}

struct AccLocationView: View {
	@StateObject private var searchManager = PlantSearchManager()
	
    var body: some View {
		ZStack {
			Color.mainPink
				.ignoresSafeArea()

			VStack {
				VStack {
					MapView(searchManager: searchManager)
						.frame(width: 320, height: 350)
						.clipShape(
							RoundedRectangle(cornerRadius: 20)
						)
						.shadow(radius: 0, x: 5, y: 5)
						.padding()
					HStack(spacing: 20) {
						PlantSearchButton(
							searchManager: searchManager,
							query: "plant store",
							systemIcon: "leaf.fill"
						)
						
						PlantSearchButton(
							searchManager: searchManager,
							query: "fertilizer",
							systemIcon: "bag.fill"
						)
						
						PlantSearchButton(
							searchManager: searchManager,
							query: "botanical garden",
							systemIcon: "tree.fill"
						)
						
						PlantSearchButton(
							searchManager: searchManager,
							query: "plant tools",
							systemIcon: "scissors"
						)
					}
				}
				
				PlantStoreListView(searchManager: searchManager)
				
			
			}


		}
    }
}

#Preview {
    AccLocationView()
}
