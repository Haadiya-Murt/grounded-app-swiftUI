//
//  PlantNav.swift
//  practicingForApp
//
//  Created by Student on 2026-05-12.
//

import SwiftUI

enum PlantTab {
	case info, tips, health, journal
}

struct PlantNav: View {
	@Binding var selectedTab: PlantTab
	
	var body: some View {
		HStack {
			Button(action: {
				selectedTab = .info
			}) {
				Image(systemName: "book.fill")
					.foregroundStyle(selectedTab == PlantTab.info ? .yellingYellows : .mainPink)
					.font(.title2)
					.background {
						if selectedTab == .info {
							Color.mainPink
								.frame(width: 100.5, height: 57)
						}
					}
			}
			
			Spacer()
			
			Button(action: {
				selectedTab = .tips
			}) {
				Image(systemName: "leaf.fill")
					.foregroundStyle(selectedTab == PlantTab.tips ? .yellingYellows : .mainPink)
					.font(.title2)
					.background {
						if selectedTab == .tips {
							Color.mainPink
								.frame(width: 100.5, height: 57)
						}
					}
			}
			
			Spacer()
			
			Button(action: {
				selectedTab = .health
			}) {
				Image(systemName: "stethoscope")
					.foregroundStyle(selectedTab == PlantTab.health ? .yellingYellows : .mainPink)
					.font(.title2)
					.background {
						if selectedTab == .health {
							Color.mainPink
								.frame(width: 100.5, height: 57)
						}
					}
			}
			
			Spacer()
			
			Button(action: {
				selectedTab = .journal
			}) {
				Image(systemName: "pencil")
					.foregroundStyle(selectedTab == PlantTab.journal ? .yellingYellows : .mainPink)
					.font(.title2)
					.background {
						if selectedTab == .journal {
							Color.mainPink
								.frame(width: 100.5, height: 57)
						}
					}
			}
		}
		.padding(.horizontal, 30)
		.padding(.vertical, 15)
		.background(Color.yellingYellows)
	}
}

#Preview {
	@Previewable @State var selectedTab = PlantTab.tips
	PlantNav(selectedTab: $selectedTab)
}
