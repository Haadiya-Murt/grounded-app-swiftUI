//
//  GardenView.swift
//  practicingForApp
//
//  Created by Student on 2026-04-20.
//

import SwiftUI
import SwiftData

struct GardenView: View {
	@Environment(\.dismiss) private var dismiss
	@Query var savedPlants: [UserPlant]
	@State private var currentZoom: CGFloat = 1.0
	@State private var finalZoom: CGFloat = 1.0
	@State private var activeSpawn: PlantSpawn? = nil
	@State var selectedImage: UIImage?
	
	var body: some View {
		ScrollViewReader { proxy in
			
			ZStack {
				
				ScrollView([.horizontal, .vertical], showsIndicators: false) {
					
					ZStack {
						Color.theGround
							.frame(width: 6000, height: 6000)
							.onTapGesture(count: 2, coordinateSpace: .local) { location in
								activeSpawn = PlantSpawn(location: location)
							}
						
						Image("housey")
							.resizable()
							.scaledToFit()
							.frame(width: 400)
							.shadow(radius: 0, x: 5, y: 7)
							.foregroundColor(.blue)
							.id("HomeBase")
						
						ForEach(savedPlants) { plant in
							
							Button(action: {},
								   label: {
								Image(systemName: "leaf.fill")
									.font(.system(size: 50))
									.foregroundStyle(.white)
							}
							)
							.position(x: CGFloat(plant.xPosition), y: CGFloat(plant.yPosition))
						}
					}
					.scaleEffect(finalZoom * currentZoom)
					.frame(width: 6000 * (finalZoom * currentZoom), height: 6000 * (finalZoom * currentZoom))
				}
				.ignoresSafeArea()
				.gesture (
					MagnificationGesture()
						.onChanged { pinchAmount in
							currentZoom = pinchAmount
						}
						.onEnded { pinchAmount in
							finalZoom *= currentZoom
							currentZoom = 1.0
							
							if finalZoom < 0.3 {
								withAnimation {
									finalZoom = 0.3
								}
							}
							if finalZoom > 3.0 {
								withAnimation {
									finalZoom = 3.0
								}
							}
						}
				)
				.fullScreenCover(item: $activeSpawn) { spawn in
					PlantOverview(spawnLocation: spawn.location, selectedImage: $selectedImage)
				}
				
				.onAppear {
					proxy.scrollTo("HomeBase", anchor: .center)
				}
				
				VStack {
					Spacer()
					HStack {
						Spacer()
						Button (
							action: { proxy.scrollTo("HomeBase", anchor: .center) },
							label: {
								Image("housey")
									.resizable()
									.scaledToFit()
									.frame(width: 100)
									.shadow(radius: 0, x: 2, y: 2)
									.foregroundColor(.blue)
									.background {
										Circle()
											.frame(width: 80, height: 80)
											.foregroundColor(.white)
											.shadow(radius: 0, x: 4, y: 4)
									}
							}
						)
					}
				}
				.padding()
			}

			
		}
	}
}

#Preview {
	GardenView()
		.modelContainer(for: UserPlant.self, inMemory: true)

}
