//
//  DarkModeButton.swift
//  practicingForApp
//
//  Created by Student on 2026-04-18.
//

import SwiftUI

struct DarkModeButton: View {
	@AppStorage("isDarkMode") var isDarkMode: Bool = false
	
    var body: some View {
		ZStack {
				Circle()
					.foregroundStyle(.black)
					.opacity(0.25)
					.frame(width: 50, height: 50)
					.overlay {
						Button("Dark Mode", systemImage: isDarkMode ? "moon.fill": "sun.max.fill") {
							
							withAnimation {
								isDarkMode.toggle()
							}
						}
						.foregroundStyle(isDarkMode ? .yellingYellows : .orangeCreamsicle)
						.font(.system(size: 35))
						.labelStyle(.iconOnly)
					}
		}
		.preferredColorScheme(isDarkMode ? .dark: .light)
    }
}

#Preview {
	@Previewable @State var isDarkMode = false
	DarkModeButton(isDarkMode: isDarkMode)
}
