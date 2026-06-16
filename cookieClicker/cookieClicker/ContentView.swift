//
//  ContentView.swift
//  cookieClicker
//
//  Created by Student on 2026-04-27.
//

import SwiftUI

struct ContentView: View {
	@Binding var touchMe: Int
	@State private var blackHole: CGFloat = 250
	
    var body: some View {
        ZStack {
			LinearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .bottom)
			
			VStack {
				Button (action: {
					touchMe += 1
					blackHole += 1
				},
						label: {
					Image(systemName: "circle.fill")
						.resizable()
						.scaledToFit()
						.frame(width: blackHole)
						.foregroundStyle(.black)
						.overlay {
							ZStack {
								Rectangle()
									.frame(width: 150, height: 45)
									.foregroundStyle(.white)
								Text("Touch")
									.foregroundStyle(.black)
									.font(.system(size: 45))
							}
						}
				}
				)
				
				
			}
			ZStack {
				Rectangle()
					.frame(width: 200, height: 60)
					.foregroundStyle(.white)
					.overlay {
						Text("Score: \(touchMe)")
							.font(.system(size: 30))
					}
			}
			.offset(y: 250)
        }
		.ignoresSafeArea()
    }
}

//#Preview {
//    ContentView()
//}
