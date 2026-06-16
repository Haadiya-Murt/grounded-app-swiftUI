//
//  MapView.swift
//  practicingForApp
//
//  Created by Student on 2026-05-05.
//

import SwiftUI
import MapKit

struct MapView: View {
	//this var is to store all the places my function finds so it can pinpoint on map
	@State private var places: [MKMapItem] = []
	
	// this makes the location go nearby if available
	@StateObject private var locationManager = LocationManager()
	
    var body: some View {
		ZStack(alignment: .bottomLeading) {
			Map {
				
				// plot markers from collection onto screen
				ForEach(places, id: \.self) { place in
					Marker(place.name ?? "Place", coordinate: place.location.coordinate)
				}
			}
			
			Button (
				action: {
					findPlaces(query: "plant store")
				},
				label: {
					Image(systemName: "leaf.fill")
						.foregroundStyle(.white)
						.font(.system(size: 48))
				}
			)
			.padding(.horizontal, 20)
		}

	}
	func findPlaces(query: String) {
		
		// for nearby feature
		let centre: CLLocationCoordinate2D

		// ask user for perms :3
		if let userLocation = locationManager.location {
			centre = userLocation.coordinate
			print("They gave me the location gang")
		} else {
			// fallback is toronto cuz idk im mississaugan
			centre = CLLocationCoordinate2D(latitude: 43.7, longitude: -79.4)
		}
		
		// give map data for search request
		let request = MKLocalSearch.Request()
		request.naturalLanguageQuery = query
		request.region = MKCoordinateRegion(
						center: centre,
						span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
				)
		let search = MKLocalSearch(request: request)
		
		
		// ask map for data
		search.start { response, error in
			if let response = response {
				self.places = response.mapItems
			}
		}
	}
}

#Preview {
    MapView()
}
