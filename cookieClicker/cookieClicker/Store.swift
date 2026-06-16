//
//  Store.swift
//  Cookie Clicker
//
//  Created by Student on 2026-04-27.
//

import SwiftUI
import SwiftData

struct Store: View {
	
	@Environment(\.modelContext) private var context // insert / remove items
	@Query private var items: [Item] // get the data
	
	var shopItems: [Item] = [
		Item(name: "clicker", imageName: "pointer.arrow", cps: 1, price: 1),
		Item(name: "earth", imageName: "globe.europe.africa.fill", cps: 10, price: 1),
		Item(name: "moon", imageName: "moon.fill", cps: 5, price: 1),
		Item(name: "moonStars", imageName: "moon.stars.fill", cps: 10, price: 1),
		Item(name: "bell", imageName: "bell.fill", cps: 10, price: 1),
		Item(name: "clicker", imageName: "pointer.arrow", cps: 1, price: 1)
	]
	
	@Binding var touchMe: Int

	var body: some View {
		
		ZStack {
			Image("shopBG")
				.resizable()
				.scaledToFill()
				.ignoresSafeArea()
			
			VStack (spacing: 45) {
				Spacer(minLength: 510)
				// the list of each item in the store
				ForEach(0..<2, id: \.self){i in
					HStack (spacing: 50) {
						
						ForEach(i*3..<i*3+3, id: \.self){j in
							// button
							Button(action: {
								if (shopItems[j].price <= touchMe) {
									touchMe -= shopItems[j].price
									let newItem = Item(name: shopItems[j].name, imageName: shopItems[j].imageName, cps: shopItems[j].cps, price: shopItems[j].price)
									context.insert(newItem)
									print("items: ", items)
								}
							}, label: {
								VStack {
									Image(systemName: shopItems[j].imageName).font(.title)
									Text(shopItems[j].name)
								}.foregroundStyle(.white)
							})
							
						}
						
					}
				}
				Text("Money: \(touchMe)").foregroundStyle(.white)
				
				Spacer()
			}
			
			VStack {
				Button (action: {
					do {
						try context.delete(model: Item.self)
						try context.save()
						print("items: ", items)
					} catch {
						print("Failed to clear all data")
					}
				}, label: {
					Text("Debug - delete everything")
						.foregroundStyle(.white)
						.padding()
						.background(Color.red)
				})
			}
			
		}
		.background(.black)
		
	}
}

//#Preview {
//	Store(touchMe: $touchMe)
//}
