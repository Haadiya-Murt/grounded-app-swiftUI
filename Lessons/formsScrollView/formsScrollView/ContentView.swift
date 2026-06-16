//
//  ContentView.swift
//  formsScrollView
//
//  Created by Student on 2026-04-10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		ScrollView {
			VStack(spacing: 30) {
				ForEach(1..<16) {
					index in
					
					Text("Section \(index)")
						.frame(maxWidth: .infinity)
						.padding()
						.background(.blue.opacity(0.1))
				}
				ScrollView(.horizontal) {
					HStack(spacing: 20) {
						ForEach(1..<11) {
							_ in
							
							Image(systemName: "star.fill")
								.resizable()
								.frame(width: 60, height: 60)
								.foregroundStyle(.purple)
								.padding()
								.background(.gray.opacity(0.1))
							
						}
					}
				}
			//	.scrollIndicators(.hidden) --> to get rid of the scroll bar (kinda makes it ugly)
			}
			.padding()
		}
		.font(.largeTitle)
    }
}

#Preview {
    ContentView()
}
