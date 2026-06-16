//
//  ThingsUnderPlantNav.swift
//  practicingForApp
//
//  Created by Student on 2026-06-04.
//

import SwiftUI
import SwiftData

struct ThingsUnderPlantNav: View {
	var spawnLocation: CGPoint?
	var editingPlant: UserPlant?
	@Binding var selectedImage: UIImage?
		
	@State var selectedTab: PlantTab = .info
	
    var body: some View {
		
		ZStack {
			Color.mainPink
				.ignoresSafeArea()
			
			VStack {
				PlantNav(selectedTab: $selectedTab)
				
				switch selectedTab {
				case .info:
					PlantOverview(spawnLocation: spawnLocation,
								  editingPlant: editingPlant,
								  selectedImage: $selectedImage)
					
				case .tips:
					PlantGrowthTips()
					
				case .health:
					PlantHealthView(plant: editingPlant)
					
				case .journal:
					PlantJournal(plant: editingPlant)
				}
				
				
			}
		}
    }
}

#Preview {
	ThingsUnderPlantNav(selectedImage: .constant(nil))
		.modelContainer(for: UserPlant.self, inMemory: true)

}
