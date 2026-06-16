//
//  JournalHistory.swift
//  practicingForApp
//
//  Created by Student on 2026-06-08.
//

import SwiftUI
import SwiftData

struct JournalHistory: View {
	var plant: UserPlant?
	@Environment(\.modelContext) private var context
	
	@State private var searchText = ""
	@State private var editingLogID: UUID? = nil
	@State private var editingLogText: String = ""
	
	var filteredLogs: [DailyLog] {
		guard let currentPlant = plant else { return [] }
		let sorted = currentPlant.dailyLogs.sorted(by: { $0.date > $1.date })
		
		if searchText.isEmpty { return sorted }
		else { return sorted.filter { $0.text.localizedCaseInsensitiveContains(searchText) } }
	}
	
	var body: some View {
		VStack(spacing: 0) {
			HStack {
				Image(systemName: "magnifyingglass")
					.foregroundColor(.white.opacity(0.6))
				TextField("Search history notes...", text: $searchText)
					.font(.custom("JetBrainsMono-Regular", size: 14))
					.foregroundStyle(.white)
			}
			.padding()
			.background(Color.relativelyDeeperPink)
			.cornerRadius(10)
			.padding()
			
			ScrollView {
				LazyVStack(spacing: 15) {
					if filteredLogs.isEmpty {
						Text("No logs found.")
							.font(.custom("JetBrainsMono-Medium", size: 14))
							.foregroundStyle(.white.opacity(0.5))
							.padding(.top, 40)
					} else {
						ForEach(filteredLogs) { log in
							VStack(alignment: .leading, spacing: 8) {
								HStack {
									Text(log.date.formatted(date: .abbreviated, time: .shortened))
										.font(.custom("JetBrainsMono-Bold", size: 12))
										.foregroundStyle(.yellingYellows)
									
									Spacer()
									
									Button(action: {
										if editingLogID == log.id {
											log.text = editingLogText
											try? context.save()
											editingLogID = nil
										} else {
											editingLogID = log.id
											editingLogText = log.text
										}
									}) {
										Image(systemName: editingLogID == log.id ? "checkmark.circle.fill" : "pencil.circle.fill")
											.font(.title3)
											.foregroundStyle(.yellingYellows)
									}
								}
								
								if editingLogID == log.id {
									TextEditor(text: $editingLogText)
										.font(.custom("JetBrainsMono-Regular", size: 14))
										.padding(6)
										.frame(height: 70)
										.scrollContentBackground(.hidden)
										.background(Color.mainPink)
										.cornerRadius(6)
										.foregroundStyle(.white)
								} else {
									Text(log.text)
										.font(.custom("JetBrainsMono-Regular", size: 14))
										.foregroundStyle(.white)
								}
							}
							.padding()
							.background(Color.relativelyDeeperPink)
							.cornerRadius(12)
						}
					}
				}
				.padding(.horizontal)
			}
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color.mainPink.ignoresSafeArea())
		.navigationTitle("History")
		.navigationBarTitleDisplayMode(.inline)
	}
}

