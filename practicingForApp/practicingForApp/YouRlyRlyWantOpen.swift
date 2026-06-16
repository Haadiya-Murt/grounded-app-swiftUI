//
//  YouRlyRlyWantOpen.swift
//  practicingForApp
//
//  Created by Student on 2026-06-02.
//

import SwiftUI
import SwiftData

// stolen from stack overflow
func uiColorMap(for key: String) -> Color {
	switch key {
	case "white": return .white
	case "yellingYellows": return .yellingYellows
	case "mainPink": return .mainPink
	case "sharkTank": return .sharkTank
	case "blackUp": return .blackUp
	case "coralHuh": return .coralHuh
	default: return .clear
	}
}

struct ColorPickerRow: View {
	@Binding var selectedColourName: String
	
	let plantPalette = [
		"white",
		"yellingYellows",
		"coralHuh",
		"mainPink",
		"sharkTank",
		"blackUp"
	]
	
	let columns = [
		GridItem(.flexible()),
		GridItem(.flexible()),
		GridItem(.flexible())
	]
	
	var body: some View {
		LazyVGrid(columns: columns, spacing: 14) {
			ForEach(plantPalette, id: \.self) { colour in
				Button(action: {
					selectedColourName = colour
				}) {
					Circle()
						.fill(uiColorMap(for: colour))
						.frame(width: 24, height: 24)
						.overlay(
							Circle()
								.stroke(Color.white, lineWidth: selectedColourName == colour ? 2.5 : 0)
								.padding(-3)
								
						)
						.scaleEffect(selectedColourName == colour ? 1.1 : 1.0)
						.animation(.spring(response: 0.2, dampingFraction: 0.6), value: selectedColourName)
						.shadow(radius: 0, x: selectedColourName == colour ? 0 : 2, y: selectedColourName == colour ? 0 : 4)
				}
				.buttonStyle(.plain)
			}
		}
		
	}
}


// MAIN CODE LOOK AT ME PLS PLS PLS STOP FORGETTING WHERE I AM
struct YouRlyRlyWantOpen: View {
	@Bindable var plant: UserPlant
	@State var icon = "son1"
	@State var colourName = "yellingYellows"
	@Binding var yesOrNo: Bool
	var onClose: () -> Void
	
	var body: some View {
		VStack(alignment: .leading, spacing: 12) {
			
			HStack(spacing: 10) {
				Image(plant.theLabel)
					.resizable()
					.scaledToFit()
					.frame(width: 32, height: 32)
					.foregroundStyle(uiColorMap(for: colourName))
				
				Text(plant.name)
					.font(.custom("ChakraPetch-Bold", size: 24))
					.foregroundStyle(.yellingYellows)
					.lineLimit(1)
				
				Button(
					action: {
						yesOrNo = true
					}, label: {
						Image(systemName: "chevron.right")
							.foregroundStyle(.yellingYellows)
					}
				)
				.padding(.trailing, 4)
				
				Button(
					action: {
						onClose()
					}) {
						Image(systemName: "xmark.circle.fill")
							.font(.system(size: 18))
							.foregroundStyle(.yellingYellows.opacity(0.6))
					}
			}
			
			Text("Pick a colour")
				.font(.custom("JetBrainsMono-Regular", size: 14))
				.foregroundStyle(.yellingYellows)
			
			ColorPickerRow(selectedColourName: $plant.colourName)
				.padding(.top, 4)
		}
		.padding(20)
		.frame(width: 220)
		.background(
			RoundedRectangle(cornerRadius: 16)
				.fill(.relativelyDeeperPink)
		)
	}
}

//#Preview {
//	YouRlyRlyWantOpen()
//} i dont wna import any binding variables :|
