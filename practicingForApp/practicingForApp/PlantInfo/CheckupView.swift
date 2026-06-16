//
//  CheckupView.swift
//  practicingForApp
//
//  Created by Student on 2026-06-09.
//

import SwiftUI
import SwiftData

struct CheckupView: View {
    @Environment(\.dismiss) private var dismiss
    var userInputText: String
    
	var diagnosis: (concerns: String, advice: String, scale: Int, garrett: String) {
        let lowered = userInputText.lowercased()
        if lowered.contains("yellow") {
            return ("Chlorosis / Moisture Retention Lockup", "Isolate soil substrate immediate. Suspend hydration rotations for 7-10 cycles. Verify structural sub-pot drainage tracks are clear.", 4, "defaultGarrett")
        } else if lowered.contains("dry") || lowered.contains("wilt") {
            return ("Dehydration Vector / Arid Atmosphere", "Administer sub-surface watering immediately. Relocate plant clear of forced HVAC airflow vents and ambient heat grids.", 3, "cheeryGarrett")
        } else if lowered.contains("spot") || lowered.contains("white") {
            return ("Fungal Pattern Formation", "Prune localized surface groupings instantly. Mist base structural tracking using diluted neem compound solutions safely.", 5, "disgusted")
        } else {
            return ("Unspecified Root Strain Patterning", "Monitor structural pigmentation profiles daily. Ensure structural exposure baselines remain unchanged.", 2, "garrettInLogo")
        }
    }

    var body: some View {
        ZStack {
			ZStack(alignment: .bottomTrailing) {
				Color.mainPink.ignoresSafeArea()
				
				Image("\(diagnosis.garrett)")
					.resizable()
					.scaledToFit()
					.frame(width: 250)
					.rotationEffect(.degrees(325))
					.offset(x: 50, y: 150)
			}
            
            VStack(spacing: 30) {
                
                VStack(spacing: 8) {
                    ZStack {
                        Circle()
                            .fill(.yellingYellows)
                            .frame(width: 80, height: 80)
						Image(systemName: "stethoscope")
                            .font(.system(size: 44))
							.foregroundStyle(.mainPink)
                    }
                    
                    Text("Garrett's Scan Analysis")
                        .font(.custom("ChakraPetch-Bold", size: 26))
                        .foregroundStyle(.yellingYellows)
                }
             //   .padding(.top, 40)
                
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("IDENTIFIED CONCERN")
                            .font(.custom("ChakraPetch-Bold", size: 17))
                            .foregroundStyle(.yellingYellows)
                        Text(diagnosis.concerns)
                            .font(.custom("JetBrainsMono-Bold", size: 15))
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.relativelyDeeperPink)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("TREATMENT ADVICE")
                            .font(.custom("ChakraPetch-Bold", size: 17))
                            .foregroundStyle(.yellingYellows)
                        Text(diagnosis.advice)
                            .font(.custom("JetBrainsMono-Regular", size: 14))
                            .foregroundStyle(.white)
                            .lineSpacing(4)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.relativelyDeeperPink)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("URGENCY RATING")
                            .font(.custom("ChakraPetch-Bold", size: 17))
                            .foregroundStyle(.yellingYellows)
                        
                        HStack(spacing: 8) {
                            ForEach(1...5, id: \.self) { index in
                                Image(systemName: "exclamationmark.shield.fill")
                                    .font(.title2)
                                    .foregroundStyle(index <= diagnosis.scale ? .yellingYellows : .white.opacity(0.15))
                            }
                            Spacer()
                            Text("Level \(diagnosis.scale) / 5")
                                .font(.custom("JetBrainsMono-Bold", size: 12))
                                .foregroundStyle(.yellingYellows)
                        }
                    }
                    .padding()
                    .background(Color.relativelyDeeperPink)
                }
                .padding(.horizontal)
                                
                Button(action: { dismiss() }) {
                    Text("Return to Health Base")
                        .font(.custom("ChakraPetch-Bold", size: 16))
                        .foregroundStyle(.relativelyDeeperPink)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.lightGreen)
                        .cornerRadius(12)
                        .shadow(radius: 0, x: 0, y: 4)
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
        }
    }
}

#Preview {
	CheckupView(userInputText: "nah")
		.modelContainer(for: UserPlant.self, inMemory: true)
}
