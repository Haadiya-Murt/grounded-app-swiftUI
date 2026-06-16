//
//  WelcomeView.swift
//  navigation
//
//  Created by Student on 2026-04-13.
//

import SwiftUI

struct WelcomeView: View {
	var username: String
	
    var body: some View {
		NavigationStack {
			VStack {
				Text("Welcome, \(username)!")
					.font(.title)
					.padding()
			}
		}
		.navigationTitle(username)
		.navigationBarTitleDisplayMode(.inline)
    }
}
