//
//  cookieClickerApp.swift
//  cookieClicker
//
//  Created by Student on 2026-04-27.
//

import SwiftUI
import SwiftData

@main
struct cookieClickerApp: App {
    @AppStorage("touchMe") private var touchMe: Int = 0

    var body: some Scene {
        WindowGroup {
            MainFile(touchMe: $touchMe)
                .modelContainer(for: Item.self)
        }
    }
}
