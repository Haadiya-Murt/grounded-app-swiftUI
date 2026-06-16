//
//  OnboardAttempt.swift
//  practicingForApp
//
//  Created by Student on 2026-04-18.
//

import SwiftUI

struct OnboardAttempt: View {
	let username: String
	var garrett: BlinkingGarrett
	let pondDepth: CGFloat
	let tip: String
	let highness: CGFloat
	let lowness: CGFloat
	let lastPage: Bool
	@AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
	
    var body: some View {
		// the entire screen (from bg to garrett)
		ZStack {
			
			// usual pink gradient bg
			LinearGradient (
				stops: [
					Gradient.Stop(color: .mainPink, location: 0.55),
					Gradient.Stop(color: .relativelyDeeperPink, location: 1.0)],
					startPoint: .top,
					endPoint: .bottom
				)
				.ignoresSafeArea()
			
			// pond garrett calls home
			VStack {
				Spacer()
					.frame(maxHeight: 850)
				Rectangle()
					.frame(maxWidth: .infinity)
					.frame(height: pondDepth)
					.foregroundStyle(Gradient(stops: [Gradient.Stop(color: .lakeBlue, location: 0.15), Gradient.Stop(color: .oligotrophicBlue, location: pondDepth > 300 ? 0.5 : 1.0)]))
			}
			.ignoresSafeArea()
			.allowsHitTesting(false)
			
			// garrett's speech bubble
			VStack {
				Spacer()
					.frame(maxHeight: highness < 0 ? highness * -1 : 0)

				// had ta make a compound shape first tho
				VStack(spacing: -5) {
					
					
					Rectangle()
						.frame(width: 350, height: 190)
						.overlay {
							HStack(spacing: 2) {
								Text(tip)
									.foregroundStyle(.darkGreen)
									.font(.custom("ChakraPetch-Bold", size: 25))
									.padding(.horizontal, 20)
									.multilineTextAlignment(.center)

								if lastPage {
									Button("Home Screen", systemImage: "arrow.forward.square.fill") {
											hasSeenOnboarding = true
									}
									.labelStyle(.iconOnly)
									.font(.custom("ChakraPetch-Regular", size: 50))
									.foregroundStyle(.darkGreen)
								}
								
							}
							.scaleEffect(highness > 0 ? 1 : -1)
						}
					Triangle()
						.frame(width: 100, height: 50)
						.rotationEffect(.degrees(180))
				}
				.scaleEffect(highness > 0 ? 1 : -1)
				.foregroundStyle(.yellingYellows)
				// stops shadows from overlapping by merging
				.compositingGroup()
				.shadow(radius: 0, y: 8)
				
				Spacer()
					.frame(maxHeight: highness > 0 ? highness : 0)
			}
			
			

			// garrett on his lilypad :)
			VStack {
				Spacer()
					.frame(maxHeight: lowness > 0 ? lowness : 0)
				VStack(spacing: -6) {
					Image(pondDepth > 700 ? "garrettCheery" : garrett.frogImageName)
						.resizable()
						.scaledToFit()
						.frame(width: 225)
						.shadow(radius: 0, y: 7)
						.rotationEffect(.degrees(pondDepth == 700 ? -30 : 0))
					Rectangle()
						.frame(width: 225, height: 7)
						.foregroundStyle(.lilypadGreen)
						.opacity(pondDepth >= 700 ? 0 : 1.0)
				}
				
				Spacer()
					.frame(maxHeight: lowness < 0 ? lowness * -1 : 0)

				
			}
			.allowsHitTesting(false)
			
		}
		.ignoresSafeArea()
	}
	
}

#Preview {
	@Previewable @State var previewUsername = "Haadu"
	@Previewable @State var garry = BlinkingGarrett()
	OnboardAttempt(username: previewUsername, garrett: garry, pondDepth: 195, tip: "Hey, \(previewUsername)! I'm Garrett the Frog! Let's get gardening!", highness: 250, lowness: 260, lastPage: false)
}
