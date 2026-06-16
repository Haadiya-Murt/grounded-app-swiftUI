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
	@State private var isPresenting = false
	@State private var selectedPlant: UserPlant? = nil
	
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
						
						if selectedPlant != nil {
							Color.white.opacity(0.001)
								.ignoresSafeArea()
								.onTapGesture {
									withAnimation(.spring(response: 0.25, dampingFraction: 0.7)) {
										selectedPlant = nil
									}
								}
						}
						
						ForEach(savedPlants) { plant in
							
							ZStack {
								Button(
									action: {
									withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
										selectedPlant = plant
									}
								},
									   label: {
										   
										   if let option = FlowerOption(rawValue: plant.theLabel) {
											   Image("\(plant.theLabel)")
												   .resizable()
												   .scaledToFit()
												   .frame(width: 50)
												   .shadow(radius: 0, x: 2, y: 2)
												   .foregroundStyle(uiColorMap(for: plant.colourName))
										   } else {
											   Image(systemName: "leaf.fill")
												   .resizable()
												   .scaledToFit()
												   .frame(width: 40)
												   .foregroundStyle(.yellingYellows)
										   }
								}
								)
								if selectedPlant?.id == plant.id {
									YouRlyRlyWantOpen(
										plant: plant,
										yesOrNo: $isPresenting,
										onClose: {
											withAnimation(.spring(response: 0.25, dampingFraction: 0.8)) {
												selectedPlant = nil
											}
										}
									)
									.offset(y: -140)
									.transition(.scale(scale: 0.8).combined(with: .opacity))
									.zIndex(1)
								}
							}
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
				
				VStack {
					Spacer()
					HStack {
						Spacer()
						Button (
							action: {
								proxy.scrollTo("HomeBase", anchor: .center)
							}, label: {
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
				
				.fullScreenCover(isPresented: $isPresenting, onDismiss: {
						selectedPlant = nil
					}) {
						if let plantToEdit = selectedPlant {
							ThingsUnderPlantNav(editingPlant: plantToEdit, selectedImage: $selectedImage)
						}
					}
				
				.fullScreenCover(item: $activeSpawn) { spawn in
					ThingsUnderPlantNav(spawnLocation: spawn.location, selectedImage: $selectedImage)
				}
				
				.onAppear {
					proxy.scrollTo("HomeBase", anchor: .center)
				}
				
				
			}

			
		}
	}
}

#Preview {
	GardenView()
		.modelContainer(for: UserPlant.self, inMemory: true)

}
