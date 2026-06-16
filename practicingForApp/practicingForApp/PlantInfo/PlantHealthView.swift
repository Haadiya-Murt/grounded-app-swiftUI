//
//  PlantHealthView.swift
//  practicingForApp
//
//  Created by Student on 2026-06-09.
//


import SwiftUI
import SwiftData
import PhotosUI

struct PlantHealthView: View {
    var plant: UserPlant?
    @Environment(\.modelContext) private var context
    
    @State private var symptomsText: String = ""
	@State var anImage: UIImage? = nil
    @State private var isAnalyzing = false
    @State private var showCheckupResult = false
    
    var statusText: String {
        return symptomsText.isEmpty ? "Healthy" : "Needs Review"
    }
    
    var lastCheckupDisplay = Date().formatted(date: .abbreviated, time: .omitted)

    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 25) {
                
                VStack(spacing: 6) {
                    Text("Plant Health Center")
                        .font(.custom("ChakraPetch-Bold", size: 30))
                        .foregroundStyle(.yellingYellows)
                    
                    HStack(spacing: 15) {
                        Text("Status: \(statusText)")
                            .font(.custom("JetBrainsMono-Bold", size: 14))
                            .foregroundStyle(symptomsText.isEmpty ? .blackUp : .yellingYellows)
                        
                        Text("•")
                            .foregroundStyle(.white.opacity(0.4))
                        
                        Text("Checked: \(lastCheckupDisplay)")
                            .font(.custom("JetBrainsMono-Regular", size: 13))
                            .foregroundStyle(.white.opacity(0.8))
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(Color.relativelyDeeperPink.opacity(0.5))
                }
                .padding(.top)

                HStack(spacing: 15) {
					Spacer()
					
					UsersGarrett(size: 50)
					                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Dr. Garrett's Clinic")
                            .font(.custom("ChakraPetch-SemiBold", size: 16))
                            .foregroundStyle(.yellingYellows)
                        Text("Upload a photo or type symptoms below for a diagnosis.")
                            .font(.custom("JetBrainsMono-Regular", size: 12))
                            .foregroundStyle(.white)
                            .lineLimit(2)
                    }
                    Spacer()
                }
                .padding()
                .background(Color.relativelyDeeperPink)
                .padding(.horizontal)

                VStack(spacing: 12) {
                    Text("Visual Inspection")
                        .font(.custom("ChakraPetch-SemiBold", size: 18))
                        .foregroundStyle(.yellingYellows)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
					Button(action: {}) {
						Rectangle()
							.fill(.white.opacity(0.5))
							.frame(maxWidth: 360)
							.frame(height: 140)
							.padding(.horizontal)
							.overlay {
								Image(systemName: "camera.fill")
									.font(.system(size: 30))
									.foregroundStyle(.relativelyDeeperPink.opacity(0.5))
							}
						
                    }
                }
                .padding(.horizontal)

                VStack(spacing: 12) {
                    Text("Observed Symptoms")
                        .font(.custom("ChakraPetch-SemiBold", size: 18))
                        .foregroundStyle(.yellingYellows)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextEditor(text: $symptomsText)
                        .font(.custom("JetBrainsMono-Regular", size: 14))
                        .padding(10)
                        .frame(height: 100)
                        .scrollContentBackground(.hidden)
                        .background(Color.relativelyDeeperPink)
                        .foregroundStyle(.white)
                        .overlay(
                            Group {
                                if symptomsText.isEmpty {
                                    Text("Describe changes (e.g., yellow leaves, dry tips, white spots...)")
                                        .font(.custom("JetBrainsMono-Regular", size: 13))
                                        .foregroundStyle(.white.opacity(0.4))
                                        .padding(.horizontal, 14)
                                        .padding(.vertical, 18)
                                        .allowsHitTesting(false)
                                }
                            }, alignment: .topLeading
                        )
                }
                .padding(.horizontal)

                Button(action: runDiagnosticScan) {
                    HStack(spacing: 10) {
                        if isAnalyzing {
                            ProgressView()
                                .tint(.relativelyDeeperPink)
                        } else {
                            Image(systemName: "waveform.and.magnifyingglass")
                            Text("Analyze Plant Health")
                        }
                    }
                    .font(.custom("ChakraPetch-Bold", size: 16))
                    .foregroundStyle(.relativelyDeeperPink)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(symptomsText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? Color.yellingYellows.opacity(0.5) : Color.yellingYellows)
                }
                .disabled(symptomsText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isAnalyzing)
                .padding(.horizontal)
                .padding(.top, 10)

                VStack(alignment: .leading, spacing: 12) {
                    Text("General Medical Records")
                        .font(.custom("ChakraPetch-SemiBold", size: 18))
                        .foregroundStyle(.yellingYellows)
                    
                    ScrollView(.vertical) {
                        Text("Ensure consistent soil humidity profiles, maximize filtered baseline ambient exposures, and clear surface dust formations routinely to verify unimpeded cuticular respiration vectors across leaf groupings.")
                            .font(.custom("JetBrainsMono-Regular", size: 13))
                            .foregroundStyle(.white.opacity(0.9))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.relativelyDeeperPink)
                    }
                    .frame(height: 90)
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .background(Color.mainPink.ignoresSafeArea())
        .fullScreenCover(isPresented: $showCheckupResult) {
            CheckupView(userInputText: symptomsText)
        }
    }
    
    private func runDiagnosticScan() {
        isAnalyzing = true
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isAnalyzing = false
            showCheckupResult = true
        }
    }
}

#Preview {
	PlantHealthView()
		.modelContainer(for: UserPlant.self, inMemory: true)
}
