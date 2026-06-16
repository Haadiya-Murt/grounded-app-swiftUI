//
//  InventoryView.swift
//  cookieClicker
//
//  Created by Student on 2026-04-27.
//


import SwiftUI
import SwiftData

struct InventoryView: View {
    let gameCatalog: [Item] = [
		Item(name: "clicker", imageName: "pointer.arrow", cps: 1, price: 1),
        Item(name: "earth", imageName: "globe.europe.africa.fill", cps: 10, price: 1),
        Item(name: "moon", imageName: "moon.fill", cps: 5, price: 1),
        Item(name: "moonStars", imageName: "moon.stars.fill", cps: 10, price: 1),
        Item(name: "bell", imageName: "bell.fill", cps: 10, price: 1),
		Item(name: "clicker", imageName: "pointer.arrow", cps: 1, price: 1),
    ]
    
    let columns = [
        GridItem(),
        GridItem(),
        GridItem()
    ]
	
	@Binding var touchMe: Int
	
    var body: some View {
        ZStack {
            Color.black
				.ignoresSafeArea()
            
            VStack {
                Text("Inventory")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding()
                
                ScrollView {
					//stolen from ashleys lesson
                    LazyVGrid(columns: columns, spacing: 30) {
						// \.name was removing last clicker instance
						ForEach(gameCatalog, id: \.self) { catalogItem in
							
                            ItemButtonView (
                                itemName: catalogItem.name,
								itemImage: catalogItem.imageName,
								touchMe: $touchMe
                            )
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

//#Preview {
//    InventoryView()
//}
