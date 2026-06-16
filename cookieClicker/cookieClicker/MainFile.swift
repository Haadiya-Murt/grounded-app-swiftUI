//
//  MainFile.swift
//  cookieClicker
//
//  Created by Student on 2026-04-27.
//

import SwiftUI
import SwiftData

struct MainFile: View {
	@Binding var touchMe: Int
	
	var body: some View {
		TabView {
			Tab("Clicker", systemImage: "square.fill") {
				ContentView(touchMe: $touchMe)
			}
			
			Tab("Store", systemImage: "storefront.fill") {
				Store(touchMe: $touchMe)
			}
			Tab("Inventory", systemImage: "circle.fill") {
				InventoryView(touchMe: $touchMe)
			}
		}
	}
}
//
//#Preview {
//    MainFile()
//}
