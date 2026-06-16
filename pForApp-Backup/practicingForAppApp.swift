//
//  practicingForAppApp.swift
//  practicingForApp
//
//  Created by Student on 2026-03-06.
//

import SwiftData
import SwiftUI

@main
struct practicingForAppApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
		.modelContainer(for: UserPlant.self)

    }
}
