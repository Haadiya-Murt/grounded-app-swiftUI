//
//  UsersGarrett.swift
//  practicingForApp
//
//  Created by Student on 2026-04-26.
//

import SwiftUI

struct UsersGarrett: View {
	@AppStorage("garrettEyes") var garrettEyes: String = "defaultEyes"
	@AppStorage("garrettMouth") var garrettMouth: String = "defaultMouth"
	@AppStorage("garrettGlam") var garrettGlam: String = "nothing"
	@AppStorage("frogColour") var frogColour: Color = Color.black
	@AppStorage("decoColour") var decoColour: Color = Color.black
	
	var size: CGFloat = 250
	
	private var glamMetrics: (width: CGFloat, offsetY: CGFloat, offsetX: CGFloat?) {
		switch garrettGlam {
		case "topHat":
			return (width: 65, offsetY: -110, offsetX: nil)
		case "scarf":
			return (width: 225, offsetY: 20, offsetX: nil)
		default:
			return (width: 75, offsetY: -75, offsetX: 70)
		}
	}
	
	var body: some View {
		let scale = size / 250.0
		
		ZStack {
			Circle()
				.frame(width: 250 * scale, height: 250 * scale)
				.foregroundStyle(.blackUp)
				.opacity(0.5)
				.offset(y: -5 * scale)
			
			Image("garrettSilhouette")
				.resizable()
				.scaledToFit()
				.foregroundStyle(frogColour)
				.frame(width: 250 * scale, height: 250 * scale)
				.clipShape(
					UnevenRoundedRectangle(
						topLeadingRadius: 0,
						bottomLeadingRadius: 125 * scale,
						bottomTrailingRadius: 125 * scale,
						topTrailingRadius: 0
					)
				)
				.overlay(alignment: .center) {
					ZStack {
						Image(garrettEyes)
							.resizable()
							.scaledToFit()
							.frame(width: 175 * scale)
							.offset(y: -70 * scale)
						
						Image(garrettMouth)
							.resizable()
							.scaledToFit()
							.frame(width: 100 * scale)
							.offset(y: -20 * scale)
						
						Image(garrettGlam)
							.resizable()
							.scaledToFit()
							.frame(width: glamMetrics.width * scale)
							.offset(x: (glamMetrics.offsetX ?? 0) * scale, y: glamMetrics.offsetY * scale)
							.shadow(radius: 0, y: 4 * scale)
					}
					.allowsHitTesting(false)
					.foregroundStyle(decoColour)
				}
		}
				
    }
}

#Preview {
	UsersGarrett()
}
