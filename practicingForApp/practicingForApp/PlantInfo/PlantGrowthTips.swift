//
//  PlantGrowthTips.swift
//  practicingForApp
//
//  Created by Student on 2026-05-21.
//

import SwiftUI
import SwiftData

struct PlantGrowthTips: View {
	
	// saving plants enabler
	@Environment(\.modelContext) var context
	@Environment(\.dismiss) private var dismiss
	@Query var savedPlants: [UserPlant]
	
	
//	// plant info
//	var spawnLocation: CGPoint?
//	@State var plantName: String = "Yanny"
//	@State var plantSpecies: String = "Dandelion"
//	@State var plantBday: Date = Date()
//	@State var careDifficulty: Int = 1
//	@Binding var selectedImage: UIImage?
	
	
	// popup stuff
	@State private var showPopup: Bool = false
	@State private var popupCategory: String = ""
	@State private var popupContent: String = ""
	
	var body: some View {
		ZStack {
			Color.mainPink
				.ignoresSafeArea()
			
			TabView {
				GrowthCard(image: "potting", title: "How to pot", description: "\(PlantData.dandelionPotting)")
				GrowthCard(image: "depotting", title: "When to depot", description: "\(PlantData.dandelionUnpotting)")
				GrowthCard(image: "transplant", title: "How to transfer", description: "\(PlantData.transplant)")
				GrowthCard(image: "kill", title: "How to propagate", description: "\(PlantData.propagation)")
				GrowthCard(image: "friend", title: "Allies", description: "\(PlantData.goodNeighbours)")
				GrowthCard(image: "enemy", title: "Foes", description: "\(PlantData.foes)")
				
			}
			.tabViewStyle(.page)
			
		}
			
			
	}
}

#Preview {
	PlantGrowthTips()
		.modelContainer(for: UserPlant.self, inMemory: true)
}

