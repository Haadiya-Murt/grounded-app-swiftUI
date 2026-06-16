//
//  SavedPlantStuff.swift
//  practicingForApp
//
//  Created by Student on 2026-05-12.
//

import Foundation
import SwiftData
import SwiftUI


@Model
class PlantReminder: Identifiable {
	var id: String
	var title: String
	var date: Date
	
	init(title: String, date: Date) {
		self.id = UUID().uuidString
		self.title = title
		self.date = date
	}
}


@Model
class DailyLog {
	var id: UUID
	var date: Date
	var text: String
	
	init(text: String) {
		self.id = UUID()
		self.date = Date()
		self.text = text
	}
}

@Model
class UserPlant {
	var name: String
	var species: String
	//var journalEntry: String? = nil
	var difficulty: Int
	var datePlanted: Date
	var theLabel: String
	var colourName: String
	var xPosition: Double
	var yPosition: Double
	var manualReminders: [PlantReminder]?
	var caretakerName: String = "None Selected"
	var isVacationDutyOn: Bool
	var useAutoNotifs: Bool
	var useManual: Bool
	
	//hacking w swift is the goat
	@Relationship(deleteRule: .cascade) var dailyLogs: [DailyLog] = []
	
	// stolen from stack overflow
	@Attribute(.externalStorage) var imageData: Data?
	
	init(name: String, species: String, difficulty: Int, datePlanted: Date, theLabel: String, colourName: String, xPosition: Double, yPosition: Double, imageData: Data? = nil, manualReminders: [PlantReminder] = [], caretakerName: String, isVacationDutyOn: Bool, useAutoNotifs: Bool, useManual: Bool) {
		self.name = name
		self.species = species
	//	self.journalEntry = journalEntry
		self.difficulty = difficulty
		self.datePlanted = datePlanted
		self.theLabel = theLabel
		self.colourName = colourName
		self.xPosition = xPosition
		self.yPosition = yPosition
		self.imageData = imageData
		self.manualReminders = manualReminders
		self.caretakerName = caretakerName
		self.isVacationDutyOn = isVacationDutyOn
		self.useAutoNotifs = useAutoNotifs
		self.useManual = useManual
	}
	
	var plantColor: Color {
			switch colourName {
			case "white": return .white
			case "yellingYellows": return .yellingYellows
			case "mainPink": return .mainPink
			case "oligotrophicBlue": return .oligotrophicBlue
			case "darkGreen": return .darkGreen
			case "orangeCreamsicle": return .orangeCreamsicle
			default: return .yellingYellows
			}
		}
	
}

struct PlantSpawn: Identifiable {
	let id = UUID()
	let location: CGPoint
}

