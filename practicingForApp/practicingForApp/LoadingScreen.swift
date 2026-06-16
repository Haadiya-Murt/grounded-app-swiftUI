//
//  LoadingScreen.swift
//  practicingForApp
//
//  Created by Student on 2026-04-02.
//

import SwiftUI

struct LoadingScreen: View {
    var body: some View {
        ZStack {
            LinearGradient (
                stops: [Gradient.Stop(color: .relativelyDeeperPink, location: 0.55),
                        Gradient.Stop(color: .mainPink, location: 0.95)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            Image("defaultGarrett")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .shadow(radius: 0, y: 7)
        }
    }
}

#Preview {
    LoadingScreen()
}
