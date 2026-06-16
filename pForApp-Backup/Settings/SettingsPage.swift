//
//  SettingsPage.swift
//  practicingForApp
//
//  Created by Student on 2026-04-20.
//

import SwiftUI

struct SettingsPage: View {
	@AppStorage("username") var username: String = "NoName"
	@AppStorage("isDarkMode") var isDarkMode: Bool = false
	
    var body: some View {
		
		NavigationStack() {
			ZStack {
				Color.lightGreen
					.ignoresSafeArea()
				
				ScrollView {
					NavigationLink {
						MasterProfile()
					} label: {
						HStack {
							UsersGarrett(size: 100)
							Spacer()
							Text("Customize your avatar!")
								.font(.custom("JetBrainsMono-Bold", size: 20))
								.foregroundStyle(.blackUp)
							Spacer()
							Image(systemName: "chevron.right")
								.foregroundStyle(.blackUp)
						}
						.padding()
						.background {
							Rectangle()
								.foregroundStyle(.darkGreen)
						}
					}
				
					NavigationLink {
						MasterProfile()
					} label: {
						HStack {
							VStack(alignment: .leading) {
								Text("Change username")
									.font(.custom("JetBrainsMono-Bold", size: 20))
									.foregroundStyle(.blackUp)
								Text(username)
									.font(.custom("JetBrainsMono-Regular", size: 20))
									.foregroundStyle(.blackUp)
							}
							Spacer()
							Image(systemName: "chevron.right")
								.foregroundStyle(.blackUp)
						}
						.padding()
						.background {
							Rectangle()
								.foregroundStyle(.darkGreen)
						}
					}
					
					HStack {
						VStack(alignment: .leading) {
							Text("Colour scheme")
								.font(.custom("JetBrainsMono-Bold", size: 20))
								.foregroundStyle(.blackUp)
							Text(isDarkMode ? "Dark" : "Light")
								.font(.custom("JetBrainsMono-Regular", size: 20))
								.foregroundStyle(.blackUp)
						}
						Spacer()
						DarkModeButton()
					}
					.padding()
					.background {
						Rectangle()
							.foregroundStyle(.darkGreen)
					}
					
					
				}
				.padding()
			}
		}
    }
}

#Preview {
	SettingsPage()
}
