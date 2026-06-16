//
//  Item.swift
//  Cookie Clicker
//
//  Created by Student on 2026-04-27.
//
import SwiftData
import SwiftUI

@Model
class Item {
	var name: String
	var imageName: String
	var cps: Int
	var price: Int
	
	init(name: String, imageName: String, cps: Int, price: Int) {
		self.cps = cps
		self.imageName = imageName
		self.name = name
		self.price = price
	}
	
}
