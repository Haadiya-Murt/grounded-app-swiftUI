//
//  heroSplashTransition.swift
//  practicingForApp
//
//  Created by Student on 2026-03-30.
//

import SwiftUI

struct SplashScreenTransition: View {
    // the var used ta communicate that the animation is done
	@Binding var isSplashFinished: Bool
	
    // controls the background gradient -- represents main trigger for other UI
    @State private var isExpanded = false
    
    // splash screen + icon opacities
    @State private var splashScreenOpacity = 0.0
    @State private var patchOpacity = 1.0
    @State private var backgroundGrad = 0.75
    
    // frog positioning
    @State private var frogLogoOrigin = CGPoint(x: 15, y: 10)
    @State private var frogRotation = 335.0
    @State private var vStackYOffset = 60.0
    @State private var frogName = "garrettInLogo"
    @State private var launchScreen = false
    
    var body: some View {
        
        // SPLASH SCREEN
        ZStack {
            
            // background (stays visible -- just clipped into frame)
            LinearGradient (
                stops: [Gradient.Stop(color: .relativelyDeeperPink, location: backgroundGrad),
                        Gradient.Stop(color: .mainPink, location: 0.95)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        
                // vines (made invisible at first)
                ZStack {
                Image("vineDeco")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 450, height: 450)
                    .offset(x: -110, y: -290)
                    .shadow(radius: 0, x: 3, y: 5)
                
                Image("vineDeco")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 450, height: 450)
                    .rotationEffect(Angle(degrees: 180))
                    .offset(x: 120, y: 270)
                    .shadow(radius: 0, x: 3, y: 5)
                
            }
            .opacity(splashScreenOpacity)
            
            VStack(alignment: .center, spacing: 0) {
                                
                // APP LOGO
                ZStack(alignment: .bottomTrailing) {
                    Image("\(frogName)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .shadow(radius: 0, y: 7)
                        .rotationEffect(.degrees(frogRotation))
                        .offset(x: frogLogoOrigin.x, y: frogLogoOrigin.y)
                    
                    // filler patch for awkward space (invisible after expansion)
                    Rectangle()
                        .fill(.yellingYellows)
                        .frame(width: 70, height: 30)
                        .offset(x: 10, y: -3)
                        .opacity(patchOpacity)
                }
                
                if !launchScreen {
                    // business name + tagline (made invisible at first)
                    VStack {
                        Text("Grounded")
                            .font(.custom("ChakraPetch-Bold", size: 50))
                            .foregroundStyle(.yellingYellows)
                            .shadow(radius: 0, y: 5)
                        
                        Text("Keep it growing.")
                            .font(.custom("JetBrainsMono-Bold",
                                          size: 22))
                            .foregroundStyle(.yellingYellows)
                            .shadow(radius: 0, y: 3)
                    }
                    .opacity(splashScreenOpacity)
                    
                }
               
            }
            .padding()
            
            // to keep the frog in the middle of the app icon
            .offset(y: vStackYOffset)
            
        }
        
        // clipping background into 150x150 box before blowing up
        .frame(
                    maxWidth: isExpanded ? .infinity : 150,
                    maxHeight: isExpanded ?  .infinity: 150
                )
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .ignoresSafeArea()
        
        // needed to start animation because view shows up in its entirety
        .onAppear {
            introAnimation()
        }
        
    }
    
    // animation to swing frog from corner to center and blow up app icon bg
    func introAnimation() {
        Task {
            try? await Task.sleep(for: .seconds(1))
            
            // moves separately; patch snaps to 0.0 immediately
            patchOpacity = 0.0

            withAnimation(.spring(duration: 0.8, bounce: 0.35)) {
                isExpanded = true
                
                // set everything back in order
                frogLogoOrigin = CGPoint(x: 0, y: 0)
                frogRotation = 360.0
                splashScreenOpacity = 1.0
                vStackYOffset = 0
    
            }
            
            try? await Task.sleep(for: .seconds(0.1))
            frogName = "defaultGarrett"
            
            loadingBri()
            
        }
    }
    
    func loadingBri() {
        Task {
            try? await Task.sleep(for: .seconds(1))
            
            withAnimation(.spring(duration: 0.8, bounce: 0.35)) {
                
                // set everything back in order
                launchScreen = true
                frogRotation = 360.0
                splashScreenOpacity = 0.0
                backgroundGrad = 0.55
                
            }
			try? await Task.sleep(for: .seconds(1))
			
			withAnimation {
				isSplashFinished = true
			}
            
        }
    }
}

#Preview {
	@Previewable @State var splashFini = false
	SplashScreenTransition(isSplashFinished: $splashFini)
}
