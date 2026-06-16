//
//  MasterOnboardFlow.swift
//  practicingForApp
//
//  Created by Student on 2026-04-16.
//

import SwiftUI

struct MasterOnboardFlow: View {
	var username: String
	@State var garrett = BlinkingGarrett()
	@State var isDarkMode: Bool = false
	@State private var showHome: Bool = false
	
	var body: some View {
		ZStack {
			TabView {
				OnboardAttempt(username: username, garrett: garrett, pondDepth: 195, tip: "Hey, \(username)! I'm Garrett the Frog! Let's get gardening!", highness: 250, lowness: 260, lastPage: false)
				OnboardAttempt(username: username, garrett: garrett, pondDepth: 250, tip: "Identify and learn about all sorts of plants with a click of your camera!", highness: 300, lowness: 150, lastPage: false)
				OnboardAttempt(username: username, garrett: garrett, pondDepth: 300, tip: "Upload images to keep track of your garden's health and get care tips!", highness: 450, lowness: 48, lastPage: false)
				OnboardAttempt(username: username, garrett: garrett, pondDepth: 500, tip: "Use the integrated map to discover resources local to you!", highness: -200, lowness: -350, lastPage: false)
				OnboardAttempt(username: username, garrett: garrett, pondDepth: 700, tip: "Avoid neglecting your plants with regular reminders to water or re-pot :)", highness: -325, lowness: -225, lastPage: false)
				
				OnboardAttempt(username: username, garrett: garrett, pondDepth: 1000, tip: "Alright, let's go!", highness: -300, lowness: -200, lastPage: true)

			}
			.tabViewStyle(.page)
			.ignoresSafeArea()
			.task {
				await garrett.garrettAnimationEnabler()
			}
			
			VStack {
				HStack {
					Spacer()
						.frame(maxWidth: 250)
					DarkModeButton()
				}
				Spacer()
					.frame(maxHeight: 750)
			}
		}

	}
}

#Preview {
	@Previewable var theTruth = "Son"
	MasterOnboardFlow(username: theTruth)
}

