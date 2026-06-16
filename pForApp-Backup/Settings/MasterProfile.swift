//
//  MasterProfile.swift
//  practicingForApp
//
//  Created by Student on 2026-04-20.
//

import SwiftUI

struct MasterProfile: View {
	@AppStorage("garrettEyes") var garrettEyes: String = "defaultEyes"
	@AppStorage("garrettMouth") var garrettMouth: String = "defaultMouth"
	@AppStorage("garrettGlam") var garrettGlam: String = "nothing"
	@AppStorage("frogColour") var frogColour: Color = Color.black
	@AppStorage("decoColour") var decoColour: Color = Color.black
	
	let eyesOptions = ["defaultEyes", "angyEyes", "ecstaticEyes", "unamusedEyes", "winkyEyes"]
	let mouthOptions = ["defaultMouth", "disgruntled", "rectangleMouth", "tightLipped", "slightSmile"]
	let accessoryOptions = ["nothing", "topHat", "scarf", "eyepatch"]
	
	private var glamMetrics: (width: CGFloat, offsetY: CGFloat, offsetX: CGFloat?) {
		switch garrettGlam {
		case "topHat":
			return (width: 65, offsetY: -110, offsetX: nil)
		case "scarf":
			return (width: 225, offsetY: 20, offsetX: nil)
		default:
			return (width: 75, offsetY: -75, offsetX: 70)
		}
	}
	
    var body: some View {
		ZStack {
			Color.mainPink
				.ignoresSafeArea()
			
			VStack {
				
				NamePreview()
				
				Spacer()
					.frame(maxHeight: 70)
				
				ZStack(alignment: .center) {
					
					ZStack(alignment: .bottom) {
						UsersGarrett()
						
						HStack {
							ColorPicker("Select a colour", selection: $frogColour)
								.labelsHidden()
							
							ColorPicker("Select a colour", selection: $decoColour)
								.labelsHidden()
						}
						.padding(.bottom, 20)
					}
					
					VStack(spacing: 20) {
						CustomizerButton(title: "Next Eyes",
										 options: eyesOptions,
										 buttonColor: .darkGreen,
										 currentSelection: $garrettEyes)
						
						CustomizerButton(title: "Next Mouth",
										 options: mouthOptions,
										 buttonColor: .lightGreen,
										 currentSelection: $garrettMouth)
						
						CustomizerButton(title: "Next Glam",
										 options: accessoryOptions,
										 buttonColor: .darkGreen,
										 currentSelection: $garrettGlam)
						
					}
				}
			}
		}
    }
}

// making the colour data type possible to store as app storage var
// pulled from stack overflow
extension Color: @retroactive RawRepresentable {
	public init?(rawValue: String) {
		guard let data = Data(base64Encoded: rawValue) else {
			self = .lightGreen
			return
		}
		do {
			let uiColor = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data) ?? .lightGreen
			self = Color(uiColor: uiColor)
		} catch {
			self = .lightGreen
		}
	}

	public var rawValue: String {
		do {
			let data = try NSKeyedArchiver.archivedData(withRootObject: UIColor(self), requiringSecureCoding: false)
			return data.base64EncodedString()
		} catch {
			return ""
		}
	}
}

#Preview {
	MasterProfile()
}
