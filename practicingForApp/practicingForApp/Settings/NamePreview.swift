//
//  NamePreview.swift
//  practicingForApp
//
//  Created by Student on 2026-05-02.
//

import SwiftUI

struct NamePreview: View {
	@AppStorage("username") var username: String = "NoName"
	
	var body: some View {
		VStack {
			Text("Username")
				.font(.custom("ChakraPetch-Bold", size: 25))
				.foregroundStyle(.relativelyDeeperPink)
			TextField("Change username", text: $username)
						.font(.custom("JetBrainsMono-Regular", size: 20))
						.textFieldStyle(.plain)
						.foregroundStyle(.mainPink)
						.padding(10)
						.autocorrectionDisabled()
						.background(.yellingYellows)
		}
		.padding(.horizontal, 20)
	}
}

#Preview {
	NamePreview()
}
