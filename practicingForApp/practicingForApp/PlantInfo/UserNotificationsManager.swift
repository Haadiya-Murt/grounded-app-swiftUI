//
//  UserNotificationsManager.swift
//  practicingForApp
//
//  Created by Student on 2026-06-08.
//

import Foundation
import UserNotifications

class NotificationManager {
	static let instance = NotificationManager()
	
	func requestAuthorization() {
		UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
			if granted {
				print("Notification access allowed!")
			} else if let error {
				print(error.localizedDescription)
			}
		}
	}
	
	func scheduleDailyReminder(title: String, body: String) {
		let content = UNMutableNotificationContent()
		content.title = title
		content.body = body
		content.sound = .default
		
		// every day at 9?
		var dateComponents = DateComponents()
		dateComponents.hour = 9
		dateComponents.minute = 0
		
		let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
		let request = UNNotificationRequest(identifier: "daily_plant_reminder", content: content, trigger: trigger)
		
		UNUserNotificationCenter.current().add(request)
	}
	
	func clearAllReminders() {
		UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
	}
}
