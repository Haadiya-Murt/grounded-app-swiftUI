//
//  Player.swift
//  Scorekeeper
//
//  Created by Student on 2026-04-22.
//

import Foundation

struct Player: Identifiable {
	let id = UUID()
	
	var name: String
	var score: Int
}
