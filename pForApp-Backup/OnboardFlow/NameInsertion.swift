//
//  NameInsertion.swift
//  practicingForApp
//
//  Created by Student on 2026-04-02.
//

import SwiftUI

struct NameInsertion: View {
	@AppStorage("username") var username: String = ""
	@State private var showOnboard = false
	
    var body: some View {
		ZStack {
			LinearGradient(stops: [
				Gradient.Stop(color: .relativelyDeeperPink, location: 0.55),
				Gradient.Stop(color: .mainPink, location: 0.95)],
				startPoint: .top,
				endPoint: .bottom
			)
			.ignoresSafeArea()
			
			Image("flowerDeco")
				.resizable()
				.scaledToFit()
				.frame(maxHeight: 450)
				.offset(y: -250)
				.shadow(radius: 0, y: 7)
			
			Image("garrettDisgusted")
				.resizable()
				.scaledToFit()
				.frame(maxWidth: 250)
				.rotationEffect(.degrees(335))
				.offset(x: 100, y: 350)
				.shadow(radius: 0, y: 10)
			
			VStack {
				Text("Ribbit!")
					.font(.custom("ChakraPetch-Bold", size: 50))
					.foregroundStyle(.yellingYellows)
				Text("That means \"hello\" in frog.")
					.font(.custom("JetBrainsMono-LightItalic",
								  size: 20))
					.foregroundStyle(.yellingYellows)
				
				Divider()
					.frame(height: 2)
					.background(.yellingYellows)
					.padding(.horizontal, 20)
				Spacer()
					.frame(maxHeight: 425)
			}
			.padding(.top, 80)
			
			VStack(alignment: .leading) {
				Text("Let's get to know each other!")
					.font(.custom("ChakraPetch-SemiBold",
								  size: 28))
					.foregroundStyle(.yellingYellows)
				
				
				Text("What is your name?")
					.font(.custom("JetBrainsMono-Italic", size: 20))
					.foregroundStyle(.yellingYellows)
				
				TextField("Enter your name", text: $username, prompt: Text("Enter your name").foregroundStyle(.relativelyDeeperPink))
					.font(.custom("JetBrainsMono-Bold", size: 18))
					.textFieldStyle(.plain)
					.foregroundStyle(.relativelyDeeperPink)
					.padding(10)
					.background(.yellingYellows)
					.cornerRadius(10)
					.autocorrectionDisabled()
					.overlay(alignment: .trailing) {
						Button("Continue", systemImage: "arrow.forward.square.fill") {
							showOnboard = true
						}
						.labelStyle(.iconOnly)
						.font(.largeTitle)
						.foregroundColor(username.isEmpty ? .gray : .lightGreen)
						.padding(.trailing, 10)
						.disabled(username.isEmpty)
						.fullScreenCover(isPresented: $showOnboard) {
							MasterOnboardFlow(username: username)
						}
					}
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.bottom, 20)
			.padding(.horizontal, 20)
						
			Image("garrettTongue")
				.resizable()
				.scaledToFit()
				.frame(width: 300)
				.offset(x: 0, y: 185)
				.shadow(radius: 0, y: 7)
				.allowsHitTesting(false)
		}
		.opacity(showOnboard ? 0 : 1.0)
    }
}

#Preview {
	NameInsertion()
}
