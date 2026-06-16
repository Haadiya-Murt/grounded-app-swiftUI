//
//  LocationManager.swift
//  practicingForApp
//
//  Created by Student on 2026-05-05.
//

import SwiftUI
import MapKit
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
	private let manager = CLLocationManager()
	
	@Published var location: CLLocation?

	override init() {
		super.init()
		manager.delegate = self
		manager.requestWhenInUseAuthorization()
		manager.startUpdatingLocation()
	}

	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		location = locations.first
	}
}

// breakdown later
