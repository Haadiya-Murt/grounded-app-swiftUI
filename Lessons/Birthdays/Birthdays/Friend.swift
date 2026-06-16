//
//  Friend.swift
//  Birthdays
//
//  Created by Student on 2026-04-30.
//

import Foundation
import SwiftData

@Model //they modify the code they are associated with...convert the structure into something that is compatible w swiftdata
class Friend {
	var name: String
	var birthday: Date
	
	init(name: String, birthday: Date) {
		self.name = name
		self.birthday = birthday
	}
	
	var isBirthdayToday: Bool {
		  Calendar.current.isDateInToday(birthday)
	}
	
}
	
