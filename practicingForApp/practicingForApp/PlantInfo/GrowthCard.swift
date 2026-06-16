//
//  GrowthCard.swift
//  practicingForApp
//
//  Created by Student on 2026-06-08.
//

import SwiftUI

struct GrowthCard: View {
	var image: String
	var title: String
	var description: String
	
    var body: some View {
		
		ZStack {
			
			Color.mainPink
				.ignoresSafeArea()
			
			VStack(spacing: 0) {
				Image(image)
					.resizable()
					.scaledToFit()
					.frame(width: 250)
					.shadow(radius: 0, x: 3, y: 3)
					.padding(.bottom)
				
				Text(title)
					.font(.custom("ChakraPetch-Bold", size: 25))
					.foregroundStyle(.relativelyDeeperPink)
					.padding(.top)
				
				ScrollView(.vertical, showsIndicators: true) {
					Text(description)
						.font(.custom("JetBrainsMono-Medium", size: 15))
						.foregroundStyle(.relativelyDeeperPink)
				}
				.frame(maxWidth: 250, maxHeight: 100)
				.padding()
				.background (
					Color.blackUp
						.opacity(0.05)
				)
				.scrollIndicatorsFlash(onAppear: true)
				

			}
			.background(alignment: .center) {
				ZStack {
					Rectangle()
						.frame(width: 320, height: 470)
						.shadow(radius: 0, x: 5, y: 5)
					VStack(spacing: 0) {
						Rectangle()
							.fill(.cream)
							.frame(width: 320, height: 280) //470
						Rectangle()
							.fill(.yellingYellows)
							.frame(width: 320, height: 190)
					}
				}
				
			}
		}
    }
}

#Preview {
	@Previewable var image = "depotting"
	@Previewable var title = "How to Pot"
	@Previewable var description = PlantData.dandelionDescription
	GrowthCard(image: image, title: title, description: description)
}
