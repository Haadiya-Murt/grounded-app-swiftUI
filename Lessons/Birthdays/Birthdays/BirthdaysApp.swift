//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Student on 2026-04-30.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
				.modelContainer(for: Friend.self)
        }
    }
}
