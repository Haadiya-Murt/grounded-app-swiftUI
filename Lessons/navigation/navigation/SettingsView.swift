//
//  SettingsView.swift
//  navigation
//
//  Created by Student on 2026-04-13.
//

import SwiftUI

struct SettingsView: View {
	@Binding var username: String
    var body: some View {
		VStack {
			Text("Settings View")
			Text("Current Username: \(username)")
		}
    }
}

#Preview {
	@Previewable @State var previewUsername = "Gaybih"
	SettingsView(username: $previewUsername)
}
