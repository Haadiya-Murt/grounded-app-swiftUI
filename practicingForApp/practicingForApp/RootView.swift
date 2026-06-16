//
//  RootView.swift
//  practicingForApp
//
//  Created by Student on 2026-04-18.
//

import SwiftUI

struct RootView: View {
	@AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
	@State private var isSplashFinished: Bool = false
	@AppStorage("isDarkMode") var isDarkMode: Bool = false
	
    var body: some View {
		ZStack {
			if !isSplashFinished {
				SplashScreenTransition(isSplashFinished: $isSplashFinished)
					.transition(.opacity)
			} else {
				if hasSeenOnboarding {
					HomeView()
						.transition(.opacity)
				} else {
					NameInsertion()
						.transition(.opacity)
				}
			}
		}
		.animation(.easeInOut(duration: 0.5), value: hasSeenOnboarding)
		.preferredColorScheme(isDarkMode ? .dark: .light)

    }
}

#Preview {
    RootView()
		.onAppear {
			UserDefaults.standard.set(false, forKey: "hasSeenOnboarding")
		}
}
