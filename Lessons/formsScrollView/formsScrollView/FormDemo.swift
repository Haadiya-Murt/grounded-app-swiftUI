//
//  FormDemo.swift
//  formsScrollView
//
//  Created by Student on 2026-04-10.
//

import SwiftUI

struct FormDemo: View {
	@State private var name = ""
	@State private var notificationsEnabled = true
	@State private var favouriteFruit = "Apple"
	let fruitOptions = ["Apple", "Banana", "Orange"]
    
	var body: some View {
		ZStack {
			Color.green.opacity(0.5)
				.edgesIgnoringSafeArea(.all)
			Form {
				Section(header: Text("User Info")) {
					TextField("Enter your name", text: $name)
				}
				
				Section(header: Text("Preferences"), footer: Text("Receive Alerts and Updates")) {
					Toggle("Enable Notifications", isOn: $notificationsEnabled)
					Picker("Favourite fruit", selection: $favouriteFruit) {
						ForEach(fruitOptions, id: \.self) {
							Text($0)
							
						}
					}
				}
				.cornerRadius(0)
				.listRowBackground(Color.blue)
				
				Section {
					Button("Submit") {
						// button code here
					}
				}
				
			}
			.scrollContentBackground(.hidden)
		}
	}
}

#Preview {
    FormDemo()
}
