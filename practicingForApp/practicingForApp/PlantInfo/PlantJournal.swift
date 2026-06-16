//
//  PlantJournal.swift
//  practicingForApp
//
//  Created by Student on 2026-05-12.
//

import SwiftUI
import SwiftData

struct PlantJournal: View {
	var plant: UserPlant?
	@Environment(\.modelContext) private var context
	
	@State private var newEntryText: String = ""
	@State private var showSuccessIndicator = false
	
	// editing logs
	@State private var editingLogID: UUID? = nil
	@State private var editingLogText: String = ""
	
	// reminder popup
	@State private var useAutoNotifs = false
	@State private var useManual = false
	
	// man reminders
	@State private var manualReminderTitle: String = ""
	@State private var manualReminderDate: Date = Date()
	
	// the caretaker
	@State private var isVacationDutyOn = false
	@State private var caretakerName: String = "None Selected"
	@State private var showContactPicker = false
	
	var body: some View {
		NavigationStack {
			ScrollView(.vertical, showsIndicators: true) {
				VStack(spacing: 25) {
					
					Text("\((plant?.name ?? "Plant"))'s Journal")
						.font(.custom("ChakraPetch-Bold", size: 32))
						.foregroundStyle(.yellingYellows)
						.padding(.top)
					
					VStack(alignment: .trailing, spacing: 8) {
						TextEditor(text: $newEntryText)
							.font(.custom("JetBrainsMono-Regular", size: 15))
							.padding(8)
							.frame(height: 100)
							.scrollContentBackground(.hidden)
							.background(Color.relativelyDeeperPink)
							.foregroundStyle(.white)
							.overlay(
								Group {
									if newEntryText.isEmpty {
										Text("Write about your plant's progress here...")
											.font(.custom("JetBrainsMono-Regular", size: 14))
											.foregroundStyle(.white.opacity(0.6))
											.padding(.horizontal, 12)
											.padding(.vertical, 16)
											.allowsHitTesting(false)
									}
								}, alignment: .topLeading
							)
						
						HStack {
							if showSuccessIndicator {
								HStack(spacing: 4) {
									Image(systemName: "checkmark.circle.fill")
									Text("Saved!")
								}
								.font(.custom("JetBrainsMono-Bold", size: 14))
								.foregroundStyle(.yellingYellows)
								.transition(.opacity.combined(with: .scale))
							}
							
							Spacer()
							
							Button(action: saveDailyLog) {
								Text("Add Entry")
									.font(.custom("ChakraPetch-Bold", size: 14))
									.foregroundStyle(.relativelyDeeperPink)
									.padding(.horizontal, 16)
									.padding(.vertical, 8)
									.background(Color.yellingYellows)
								//	.cornerRadius(8)
							}
							.disabled(newEntryText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
						}
					}
					.padding(.horizontal)
					
					let currentLogs = plant?.dailyLogs ?? []
					if !currentLogs.isEmpty {
						NavigationLink(destination: JournalHistory(plant: plant)) {
							HStack {
								VStack(alignment: .leading, spacing: 4) {
									Text("View Complete History")
										.font(.custom("ChakraPetch-SemiBold", size: 18))
									Text("\(currentLogs.count) total entries recorded")
										.font(.custom("JetBrainsMono-Regular", size: 12))
										.opacity(0.8)
								}
								Spacer()
								Image(systemName: "chevron.right")
									.font(.title3)
							}
							.padding()
							.foregroundStyle(.yellingYellows)
							.background(Color.relativelyDeeperPink)
							//.cornerRadius(12)
							.padding(.horizontal)
						}
					}
					
					// reminders
					VStack(spacing: 12) {
						Text("Reminders")
							.font(.custom("ChakraPetch-SemiBold", size: 22))
							.foregroundStyle(.yellingYellows)
						
						// auto reminders
						VStack(spacing: 0) {
							Toggle(isOn: $useAutoNotifs.animation(.spring())) {
								Text("Default app notifications")
									.font(.custom("JetBrainsMono-Medium", size: 14))
									.foregroundStyle(.white)
							}
							.toggleStyle(SwitchToggleStyle(tint: .oligotrophicBlue))
							.padding()
							
							if useAutoNotifs {
								VStack(alignment: .leading, spacing: 4) {
									Divider().background(Color.mainPink)
									Text("• Scheduled for 9:00 AM daily")
									Text("• Auto reminds to log plant updates")
								}
								.font(.custom("JetBrainsMono-Regular", size: 12))
								.foregroundStyle(.yellingYellows)
								.frame(maxWidth: .infinity, alignment: .leading)
								.padding([.horizontal, .bottom])
							}
						}
						.background(Color.relativelyDeeperPink)
						//.cornerRadius(10)
						
						// manual reminders
						VStack(spacing: 0) {
							Toggle(isOn: $useManual.animation(.spring())) {
								Text("Manual reminders")
									.font(.custom("JetBrainsMono-Medium", size: 14))
									.foregroundStyle(.white)
							}
							.toggleStyle(SwitchToggleStyle(tint: .oligotrophicBlue))
							.padding()
							
							if useManual {
								VStack(spacing: 12) {
									Divider()
										.background(Color.mainPink)
									
									let savedReminders = plant?.manualReminders ?? []
									if !savedReminders.isEmpty {
										ForEach(savedReminders) { reminder in
											HStack {
												VStack(alignment: .leading, spacing: 4) {
													Text(reminder.title)
														.font(.custom("JetBrainsMono-Bold", size: 14))
														.foregroundStyle(.white)
													Text(reminder.date.formatted(date: .abbreviated, time: .shortened))
														.font(.custom("JetBrainsMono-Regular", size: 12))
														.foregroundStyle(.yellingYellows)
												}
												Spacer()
												Button(action: { deleteReminder(reminder) }) {
													Image(systemName: "trash.fill")
														.font(.title3)
														.foregroundStyle(.red.opacity(0.8))
														.padding(8)
												}
											}
											.padding(10)
											.background(Color.mainPink)
											//.cornerRadius(8)
										}
										Divider().background(Color.mainPink)
									}
									
									TextField("Label (e.g., Repotting, Fertilizer)", text: $manualReminderTitle)
										.font(.custom("JetBrainsMono-Regular", size: 13))
										.padding(8)
										.background(Color.mainPink)
									//.cornerRadius(6)
										.foregroundStyle(.white)
									
									DatePicker("Alert date:", selection: $manualReminderDate, in: Date()..., displayedComponents: [.date, .hourAndMinute])
										.font(.custom("JetBrainsMono-Regular", size: 13))
										.foregroundStyle(.yellingYellows)
									
									Button(action: setCustomManualNotification) {
										Text("Set Alert Action")
											.font(.custom("ChakraPetch-Bold", size: 13))
											.foregroundStyle(.relativelyDeeperPink)
											.padding(.vertical, 6)
											.frame(maxWidth: .infinity)
											.background(Color.yellingYellows)
										//.cornerRadius(6)
									}
									.disabled(manualReminderTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
								}
								.padding([.horizontal, .bottom])
							}
						}
						.background(Color.relativelyDeeperPink)
						//.cornerRadius(10)
					}
					.padding(.horizontal)
					
					// vacation
					VStack(spacing: 10) {
						Text("Vacation duty")
							.font(.custom("ChakraPetch-SemiBold", size: 22))
							.foregroundStyle(.yellingYellows)
						
						Toggle(isOn: $isVacationDutyOn) {
							Text("Caretaker: \(caretakerName)")
								.font(.custom("JetBrainsMono-Medium", size: 14))
								.foregroundStyle(.white)
						}
						.toggleStyle(SwitchToggleStyle(tint: .oligotrophicBlue))
						.padding()
						.background(Color.relativelyDeeperPink)
						//.cornerRadius(10)
						.onChange(of: isVacationDutyOn) { _, newValue in
							if newValue && caretakerName == "None Selected" {
								showContactPicker = true
							}
							else if !newValue {
								caretakerName = "None Selected"
							}
						}
					}
					.padding(.horizontal)
					.padding(.bottom, 40)
				}
			}
			.background(
				Color.mainPink
					.ignoresSafeArea()
			)
			.onAppear {
				if let currentPlant = plant {
					caretakerName = currentPlant.caretakerName
					isVacationDutyOn = currentPlant.caretakerName != "None Selected"
					useAutoNotifs = currentPlant.useAutoNotifs
					useManual = currentPlant.useManual
				}
			}
			.onChange(of: useAutoNotifs) { _, newValue in
				plant?.useAutoNotifs = newValue
				try? context.save()
			}
			.onChange(of: useManual) { _, newValue in
				plant?.useManual = newValue
				try? context.save()
			}

			.onChange(of: caretakerName) { _, newValue in
				plant?.caretakerName = newValue
				try? context.save()
			}
			.sheet(isPresented: $showContactPicker) {
				ContactPickerView(selectedContactName: $caretakerName, isEnabled: $isVacationDutyOn)
			}
		}
	}
	
	private func saveDailyLog() {
		guard let currentPlant = plant else { return }
		
		let newLog = DailyLog(text: newEntryText)
		
		context.insert(newLog)
		currentPlant.dailyLogs.append(newLog)
		
		try? context.save()
		
		newEntryText = ""
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
		
		withAnimation(.spring()) {
			showSuccessIndicator = true
		}
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
			withAnimation {
				showSuccessIndicator = false
			}
		}
	}
	
	private func setCustomManualNotification() {
		guard let currentPlant = plant else { return }
		
		let newReminder = PlantReminder(title: manualReminderTitle, date: manualReminderDate)
		context.insert(newReminder)
		
		if currentPlant.manualReminders == nil {
			currentPlant.manualReminders = []
		}
		currentPlant.manualReminders?.append(newReminder)
		try? context.save()
		
		let plantName = currentPlant.name
		let reminderTitle = "\(manualReminderTitle) - (\(plantName)) 🪴"
		let content = UNMutableNotificationContent()
		content.title = reminderTitle
		content.body = "Your scheduled care log target is due now."
		content.sound = .default
		
		let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: manualReminderDate)
		let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
		
		let request = UNNotificationRequest(identifier: newReminder.id, content: content, trigger: trigger)
		UNUserNotificationCenter.current().add(request)
		
		manualReminderTitle = ""
	}
	
	private func deleteReminder(_ reminder: PlantReminder) {
		guard let currentPlant = plant else { return }
		
		UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [reminder.id])
		
		currentPlant.manualReminders?.removeAll(where: { $0.id == reminder.id })
		context.delete(reminder)
		try? context.save()
	}
	
}
#Preview {
	PlantJournal()
		.modelContainer(for: UserPlant.self, inMemory: true)
}

