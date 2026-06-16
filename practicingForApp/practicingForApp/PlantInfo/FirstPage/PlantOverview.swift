//
//  PlantOverview.swift
//  practicingForApp
//
//  Created by Student on 2026-05-12.
//

import SwiftUI
import SwiftData

enum FlowerOption: String, CaseIterable, Identifiable {
	case son1, son2, son3
	
	var id: Self { self }
	
	var matchingAsset: String {	self.rawValue }
	
	var matchingName: String {
		switch self {
		case .son1:
			return "Ornamental"
		case .son2:
			return "Edible"
		default:
			return "Ecological"
		}
	}
}


struct PlantOverview: View {
	
	// saving plants enabler
	@Environment(\.modelContext) var context
	@Environment(\.dismiss) private var dismiss
	@Query var savedPlants: [UserPlant]
	
	// plant info
	var spawnLocation: CGPoint?
	var editingPlant: UserPlant?
	@State var plantName: String = "Planty"
	@State var plantSpecies: String = "Unknown"
	@State private var isScanned: Bool = false
	@State var plantBday: Date = Date()
	@State var careDifficulty: Int = 0
	@Binding var selectedImage: UIImage?
	@State var selectedType: FlowerOption = .son1
	
	// popup stuff
	@State private var showPopup: Bool = false
	@State private var popupCategory: String = ""
	@State private var popupContent: String = ""

	
    var body: some View {
		
		NavigationStack() {
			ZStack {
				Color.mainPink
					.ignoresSafeArea()
				

				VStack {					
					ScrollView(.vertical, showsIndicators: true) {
						
						VStack {
							Spacer()
								.frame(maxHeight: 25)
							
							TextField("Insert plant name", text: $plantName)
								.font(.custom("ChakraPetch-SemiBold", size: 30))
								.frame(width: 300)
								.multilineTextAlignment(.center)
								.foregroundStyle(.yellingYellows)
								.padding()
								.background {
									Rectangle()
										.fill(.relativelyDeeperPink)
								}
							
							HStack {
								HStack {
									Text("Date planted:")
										.font(.custom("JetBrainsMono-Medium", size: 14))
										.foregroundStyle(.yellingYellows)
									DatePicker("Date planted", selection: $plantBday, displayedComponents: [.date])
										.labelsHidden()
									//	.font(.custom("JetBrainsMono-Medium", size: 14))
								}
								
								Spacer()
								
								Menu {
									ForEach(FlowerOption.allCases, id: \.self) { option in
										Button(action: {
											selectedType = option
										}) {
											Label(
												title: { Text(option.matchingName) },
												icon: {
													Image(option.matchingAsset)
														.foregroundStyle(.yellingYellows)
												}
											)
										}
									}
								} label: {
									HStack(spacing: 6) {
										Image(selectedType.matchingAsset)
											.resizable()
											.scaledToFit()
											.frame(width: 28)
											.foregroundStyle(.yellingYellows)
										
										Image(systemName: "chevron.down")
											.font(.system(size: 10, weight: .bold))
											.foregroundStyle(.yellingYellows)
									}
									.padding(.horizontal, 10)
									.frame(height: 36)
									.background(Rectangle().fill(.relativelyDeeperPink))
								}
							}
							.padding(.horizontal)
							
							HStack(spacing: 20) {
								NavigationLink {
									CameraView(selectedImage: $selectedImage)
								} label: {
									
									if let plantImage = selectedImage {
										Image(uiImage: plantImage)
											.resizable()
											.scaledToFill()
											.frame(width: 150, height: 150)
											.clipped()
											.overlay {
												Image("borderDeco")
													.resizable()
													.scaledToFill()
													.frame(width: 180)
													.scaleEffect(x: -1)
													.shadow(radius: 0, x: 2, y: 3)
											}
									}
									else {
										Rectangle()
											.fill(.white.opacity(0.5))
											.frame(width: 150, height: 150)
											.overlay {
												ZStack {
													Image(systemName: "camera.fill")
														.font(.system(size: 30))
														.foregroundStyle(.relativelyDeeperPink.opacity(0.5))
													
													Image("borderDeco")
														.resizable()
														.scaledToFill()
														.frame(width: 180)
														.scaleEffect(x: -1)
														.shadow(radius: 0, x: 2, y: 3)
												}
											}
									}
								}
								
								VStack {
									Text(plantSpecies.capitalized)
										.font(.custom("ChakraPetch-Bold", size: 25))
										.multilineTextAlignment(.center)
										.foregroundStyle(.yellingYellows)
										.padding(.bottom, 8)
									
									Text("Difficulty")
										.font(.custom("JetBrainsMono-MediumItalic", size: 20))
										.multilineTextAlignment(.center)
										.foregroundStyle(.yellingYellows)
										.padding(.bottom, 5)
									
									
									VStack(spacing: 5) {
										
										HStack(spacing: 12) {
											ForEach(1...3, id: \.self) { icon in
												Image("garrettSilhouette")
													.resizable()
													.scaledToFit()
													.frame(width: 30)
													.foregroundStyle((isScanned && careDifficulty >= icon) ? .yellingYellows : .relativelyDeeperPink)
											}
										}
										
										HStack(spacing: 12) {
											ForEach(4...5, id: \.self) { icon in
												Image("garrettSilhouette")
													.resizable()
													.scaledToFit()
													.frame(width: 30)
													.foregroundStyle((isScanned && careDifficulty >= icon) ? .yellingYellows : .relativelyDeeperPink)
											}
										}
									}
								}
								
							}
							.padding()
							.padding(.bottom)
							
							VStack(spacing: 0) {
								VStack(spacing: 2) {
									Text(isScanned ? "Garrett's Logbook on" : "")
										.font(.custom("JetBrainsMono-Bold", size: 16))
										.foregroundStyle(.yellingYellows.opacity(0.8))
									Text(isScanned ? "\(plantSpecies)s" : "Awaiting scan...")
										.font(.custom("ChakraPetch-Bold", size: isScanned ? 28 : 18))
										.foregroundStyle(.yellingYellows)
								}
								.padding(.bottom, 15)
							
								VStack(spacing: 1) {
									categoryButton(index: "01", title: "Description", content: PlantData.dandelionDescription)
									categoryButton(index: "02", title: "Optimal Conditions", content: PlantData.dandelionConditions)
									categoryButton(index: "03", title: "Dangers", content: PlantData.dandelionDangers)
									categoryButton(index: "04", title: "Benefits", content: PlantData.dandelionBenefits)
								}
								.background(Color.relativelyDeeperPink)
								.cornerRadius(12)
								.overlay(
									Rectangle()
										.stroke(.yellingYellows, lineWidth: 1.5)
								)
								.opacity(isScanned ? 1.0 : 0.5)
							}
						}
						.padding(.horizontal)
					}
						Button (
							action: {
								if let plant = editingPlant {
									plant.name = plantName
									plant.species = plantSpecies
									plant.datePlanted = plantBday
									plant.difficulty = careDifficulty
									plant.theLabel = selectedType.rawValue
									
									// also stolen from stack overflow
									if let image = selectedImage {
										plant.imageData = image.jpegData(compressionQuality: 0.8)
									}
									
								} else {
									let newPlant = UserPlant(
										name: plantName,
										species: plantSpecies,
										//got rid of journalEntry: nil,
										difficulty: careDifficulty,
										datePlanted: plantBday,
										theLabel: selectedType.rawValue,
										colourName: "white",
										xPosition: Double( spawnLocation?.x ?? 3000),
										yPosition: Double(spawnLocation?.y ?? 3000),
										imageData: selectedImage?.jpegData(compressionQuality: 0.8),
										caretakerName: "None Selected",
										isVacationDutyOn: false,
										useAutoNotifs: false,
										useManual: false
									)
									context.insert(newPlant)
								}
								selectedImage = nil
								
								dismiss()
								
							},
							label: {
								Text("Save \(plantName) to garden!")
									.font(.custom("ChakraPetch-Bold", size: 22))
									.foregroundStyle(.relativelyDeeperPink)
									.padding()
									.background(
										Rectangle()
											.fill(.yellingYellows)
									)
							}
						)
				}
			
				if showPopup {
					Color.black
						.opacity(0.55)
						.ignoresSafeArea()
						.onTapGesture {
							withAnimation {
								showPopup = false
							}
						}
					
					VStack(spacing: 0) {
						
						HStack {
							Text("✦   \(popupCategory)   ✦")
								.font(.custom("ChakraPetch-Bold", size: 18))
								.foregroundStyle(.relativelyDeeperPink)
								.shadow(radius: 0, x:0.5, y: 0.5)
							Spacer()
							
							Button(action: {
								withAnimation {
									showPopup = false
								}
							}) {
								Image(systemName: "xmark.circle.fill")
									.font(.title2)
									.foregroundColor(.relativelyDeeperPink)
							}
						}
						.padding()
						.background(.yellingYellows)
						
						ScrollView(.vertical, showsIndicators: true) {
							VStack(alignment: .leading, spacing: 14) {
								let pieces = popupContent.components(separatedBy: "\n\n")
								ForEach(pieces, id: \.self) { paragraph in
									if !paragraph.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
										HStack(alignment: .top, spacing: 8) {
											Text("•")
												.font(.custom("JetBrainsMono-Bold", size: 16))
												.foregroundStyle(.relativelyDeeperPink)
											Text(paragraph.trimmingCharacters(in: .whitespacesAndNewlines))
												.font(.custom("JetBrainsMono-Medium", size: 14))
												.foregroundStyle(.blackUp)
												.lineSpacing(4)
										}
										.shadow(radius: 0, x:0.5, y: 0.5)

									}
								}
							}
							.padding()
						}
						.frame(maxHeight: 320)
					}
					.frame(width: 310)
					.background(.cream)
					.overlay {
						Rectangle().stroke(.relativelyDeeperPink, lineWidth: 3)
					}
					.transition(.scale.combined(with: .opacity))
					
				}
			}
			.onAppear {
				if let plant = editingPlant {
					plantName = plant.name
					plantBday = plant.datePlanted
					careDifficulty = plant.difficulty
					isScanned = true
					
					if let savedEnum = FlowerOption(rawValue: plant.theLabel) {
								selectedType = savedEnum
					}
					
					if let data = plant.imageData {
								selectedImage = UIImage(data: data)
					}
				}
			}
			.onChange(of: selectedImage) { _, newImage in
				if newImage != nil {
					withAnimation(.easeInOut(duration: 0.5)) {
						plantSpecies = "Dandelion"
						careDifficulty = 2
						isScanned = true
					}
				}
			}
			
		}
    }
	func categoryButton(index: String, title: String, content: String) -> some View {
		Button(action: {
			if isScanned {
				popupCategory = title
				popupContent = content
				withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) { showPopup = true
				}
			}
		}) {
			HStack {
				Text("[ \(index) ]")
					.font(.custom("JetBrainsMono-Bold", size: 18))
					.foregroundStyle(.yellingYellows.opacity(0.8))
					.padding(.trailing, 4)
				Text(title)
					.font(.custom("JetBrainsMono-Bold", size: 18))
					.foregroundStyle(.yellingYellows)
				
				Spacer()
				
				Image(systemName: "chevron.right.square")
					.font(.body)
					.foregroundStyle(.yellingYellows.opacity(0.8))
			}
			.padding(.horizontal, 20)
			.padding(.vertical, 16)
			.frame(maxWidth: .infinity)
			.background(Color.relativelyDeeperPink)
		}
		.disabled(!isScanned)
	}
}

#Preview {
	PlantOverview(selectedImage: .constant(nil))
		.modelContainer(for: UserPlant.self, inMemory: true)
}

