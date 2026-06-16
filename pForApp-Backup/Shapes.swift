//
//  Trapezoid.swift
//  practicingForApp
//
//  Created by Student on 2026-04-14.
//

import SwiftUI

struct Triangle: Shape {
	func path(in rect: CGRect) -> Path {
		var path = Path()
		path.move(to: CGPoint(x: rect.midX, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
		path.closeSubpath()
		return path
	}
}

struct Trapezoid: Shape {
	func path(in rect: CGRect) -> Path {
		var path = Path()
		
		// Define the corners of the trapezoid
		path.move(to: CGPoint(x: rect.minX + rect.width * 0.25, y: rect.minY)) // Top Left
		path.addLine(to: CGPoint(x: rect.maxX - rect.width * 0.25, y: rect.minY)) // Top Right
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // Bottom Right
		path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY)) // Bottom Left
		path.closeSubpath()
		
		return path
	}
}

// un exemple pour modifier plus tard
struct oiVey: View {
	var body: some View {
		Trapezoid()
			.fill(Color.blue)
			.frame(width: 200, height: 100)
		
		Triangle()
			.fill(.green)
			.frame(width: 200, height: 100)
	}
}

#Preview {
	oiVey()
}
