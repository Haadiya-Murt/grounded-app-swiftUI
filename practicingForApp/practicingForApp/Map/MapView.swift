//
//  MapView.swift
//  practicingForApp
//
//  Created by Student on 2026-05-05.
//

import Foundation
import SwiftUI
import MapKit
import Combine

class PlantSearchManager: ObservableObject {
	@Published var places: [MKMapItem] = []
	
	private var locationManager = LocationManager()
	
	func findPlaces(query: String) {
		let centre: CLLocationCoordinate2D
		
		if let userLocation = locationManager.location {
			centre = userLocation.coordinate
			print("Location access granted.")
		} else {
			// fallback to toronto cuz mississauga fr
			centre = CLLocationCoordinate2D(latitude: 43.7, longitude: -79.4)
		}
		
		let request = MKLocalSearch.Request()
		request.naturalLanguageQuery = query
		request.region = MKCoordinateRegion(
			center: centre,
			span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
		)
		
		let search = MKLocalSearch(request: request)
		search.start { response, error in
			if let response = response {
				DispatchQueue.main.async {
					self.places = response.mapItems
				}
			}
		}
	}
}

struct PlantSearchButton: View {
	@ObservedObject var searchManager: PlantSearchManager
	
	let query: String
	let systemIcon: String
	
	var body: some View {
		Button(action: {
			searchManager.findPlaces(query: query)
		}) {
			Image(systemName: systemIcon)
				.font(.system(size: 24, weight: .bold))
				.foregroundStyle(.white)
				.frame(width: 30, height: 30)
				.padding()
				.background(
					Circle()
						.fill(Color.darkGreen)
						.shadow(radius: 0, x: 3, y: 3)
				)
		}
		.buttonStyle(.plain)
	}
}

struct MapView: View {
	@ObservedObject var searchManager: PlantSearchManager
	
	var body: some View {
		Map {
			ForEach(searchManager.places, id: \.self) { place in
				Marker(place.name ?? "Place", coordinate: place.location.coordinate)
			}
		}
	}
}
//#Preview {
  //  MapView()
//}
