//
//  GarrettsBeautifulEyes.swift
//  practicingForApp
//
//  Created by Student on 2026-04-16.
//

import SwiftUI

@MainActor
@Observable
class BlinkingGarrett {
	
	// the current frog frame that updates
	var frogImageName: String = "garrett000"
	
	// the function that updates the current frog image
	func garrettAnimationEnabler() async {
		while true {
			for index in 0..<6 {
				if index != 0 {
					frogImageName = "garrett00\(index)"
					try? await Task.sleep(for: .seconds(0.15))
				} else {
					frogImageName = "garrett00\(index)"
					try? await Task.sleep(for: .seconds(5))
				}
			}
		}
	}
}
