//
//  CustomizerButton.swift
//  practicingForApp
//
//  Created by Student on 2026-05-02.
//

import SwiftUI

struct CustomizerButton: View {
	let title: String
	let options: [String]
	let buttonColor: Color
	@Binding var currentSelection: String
	
	var body: some View {
		HStack {
			Button(title, systemImage: "arrowtriangle.left.fill") {
				if let currentIndex = options.firstIndex(of: currentSelection) {
					let nextIndex = (currentIndex - 1 + options.count) % options.count
					print(nextIndex)
					currentSelection = options[nextIndex]
				}
			}
			
			Spacer()
				.frame(maxWidth: 270)

			Button(title, systemImage: "arrowtriangle.right.fill") {
				if let currentIndex = options.firstIndex(of: currentSelection) {
					let nextIndex = (currentIndex + 1) % options.count
					currentSelection = options[nextIndex]
				}
			}
		}
		.labelStyle(.iconOnly)
		.padding(.horizontal, 20)
		.foregroundStyle(buttonColor)
		.font(.system(size: 30))

	}
}


