//
//  HomeView.swift
//  navigation
//
//  Created by Student on 2026-04-13.
//

import SwiftUI

struct HomeView: View {
	@Binding var username: String
	
    var body: some View {
		VStack {
			TextField("Username", text: $username)
				.textFieldStyle(.roundedBorder)
			NavigationLink("Continue") {
				WelcomeView(username: username)
			}
		}
		.padding()
		.navigationTitle("Home")
		.navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
	@Previewable @State var previewUsername = "Gaybih"
	HomeView(username: $previewUsername)
}
