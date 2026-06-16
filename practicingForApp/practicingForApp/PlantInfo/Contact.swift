//
//  ReminderContact.swift
//  practicingForApp
//
//  Created by Student on 2026-06-08.
//

import Foundation
import UserNotifications
import ContactsUI
import SwiftUI

struct ContactPickerView: UIViewControllerRepresentable {
	@Binding var selectedContactName: String
	@Binding var isEnabled: Bool
	
	func makeUIViewController(context: Context) -> CNContactPickerViewController {
		let picker = CNContactPickerViewController()
		picker.delegate = context.coordinator
		return picker
	}
	
	func updateUIViewController(_ uiViewController: CNContactPickerViewController, context: Context) {}
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	class Coordinator: NSObject, CNContactPickerDelegate {
		var parent: ContactPickerView
		
		init(_ parent: ContactPickerView) {
			self.parent = parent
		}
		
		func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
			let fullName = "\(contact.givenName) \(contact.familyName)".trimmingCharacters(in: .whitespacesAndNewlines)
			parent.selectedContactName = fullName.isEmpty ? "Unknown Contact" : fullName
			parent.isEnabled = true
		}
		
		func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
			parent.isEnabled = false
		}
	}
}
