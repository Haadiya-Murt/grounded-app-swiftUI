//
//  ItemButtonView.swift
//  cookieClicker
//
//  Created by Student on 2026-04-27.
//

import SwiftUI
import SwiftData

struct ItemButtonView: View {
	@Environment(\.modelContext) private var modelContext
	//UNCOMMENT below if not testing
	@Query var items: [Item]
	
	// COMMENT out if using query... purely testing purposes
	//@Binding var items: [Item] // binding because preview owns list
	@State private var showPopup = false
	@State private var popupMessage = ""
	var itemName: String
	var itemImage: String
	
	@Binding var touchMe: Int
	
	var body: some View {
		
		Button("\(itemName)", systemImage: itemImage) {
			popupMessage = inventoryText()
			showPopup = true
		}
		.buttonStyle(.borderedProminent)
		.labelStyle(.iconOnly)
		.font(.title2)
		.alert("\(itemName) Inventory", isPresented: $showPopup) {
			Button("OK", role: .cancel) { }
			Button( "Sell") {
				var itemToDelete: Item? = nil
				for item in items {
					if item.name == itemName {
						itemToDelete = item
					}
				}
				if let safeItem = itemToDelete {
					modelContext.delete(safeItem)
					touchMe += safeItem.price
					} else {
						print("You don't have any \(itemName)s left to sell!")
					}
			}
		} message: {
			Text(popupMessage)
		}
	}
	
	func inventoryText() -> String {
		var specificItemCount = 0
		
		for item in items {
			if item.name == itemName {
				specificItemCount += 1
			}
		}
		
		if specificItemCount == 0 {
			return "You don't have any \(itemName)s yet!"
		} else {
			return "\(itemName): x\(specificItemCount)"
		}
	}
}

//#Preview {
//	@Previewable var itemName = "clicker"
//	@Previewable var itemImage = "square.fill"
//	ItemButtonView(itemName: itemName, itemImage: itemImage)
//}
