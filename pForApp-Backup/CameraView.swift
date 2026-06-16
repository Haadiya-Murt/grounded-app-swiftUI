//
//  CameraView.swift
//  practicingForApp
//
//  Created by Student on 2026-05-06.
//

import SwiftUI
import PhotosUI

struct CameraView: View {
	@Binding var selectedImage: UIImage?
	@State private var isShowingCamera = false
	@State private var selectedLibraryItem: PhotosPickerItem? = nil
	
	var body: some View {
		ZStack {
			Color.lakeBlue
				.ignoresSafeArea()
			
			VStack(spacing: 30) {
				ZStack {
					if let selectedImage {
						Image(uiImage: selectedImage)
							.resizable()
							.scaledToFill()
							.frame(width: 300, height: 300)
							.clipShape(Rectangle())
							.overlay {
								Image("borderDeco")
									.resizable()
									.scaledToFill()
									.frame(width: 365)
									.shadow(radius: 0, x: 2, y: 3)
							}
							.transition(.scale)
							.id(selectedImage)
					} else {
						Rectangle()
							.fill(.blackUp)
							.frame(width: 300, height: 300)
							.overlay {
								ZStack {
									Text("Upload an image\nor\ntake a photo")
										.font(.custom("JetBrainsMono-SemiBold", size: 17))
										.foregroundStyle(.lightGreen)
										.multilineTextAlignment(.center)
									Image("borderDeco")
										.resizable()
										.scaledToFill()
										.frame(width: 365)
										.shadow(radius: 0, x: 2, y: 3)
								}
							}
					}
				}
				.animation(.spring(response: 0.25, dampingFraction: 0.6), value: selectedImage)
				
				HStack(spacing: 40) {
					Button {
						isShowingCamera = true
					} label: {
						VStack {
							Image(systemName: "camera.fill")
								.font(.title)
							Text("Camera")
								.font(.custom("JetBrainsMono-SemiBold", size: 15))
						}
						.foregroundStyle(.blackUp)
					}
					
					PhotosPicker(selection: $selectedLibraryItem, matching: .images) {
						VStack {
							Image(systemName: "photo.on.rectangle.angled")
								.font(.title)
							Text("Library")
								.font(.custom("JetBrainsMono-SemiBold", size: 15))
						}
						.foregroundStyle(.blackUp)
					}
					.onChange(of: selectedLibraryItem) { oldValue, newValue in
						Task {
							if let data = try? await newValue?.loadTransferable(type: Data.self),
							   let uiImage = UIImage(data: data) {
								await MainActor.run {
									withAnimation(.spring(response: 0.25, dampingFraction: 0.6)) {
										selectedImage = uiImage
									}
								}
							}
						}
						
					}
				}
			}
			.sheet(isPresented: $isShowingCamera) {
				ImagePicker(selectedImage: $selectedImage, sourceType: .camera)
			}
		}
	}
}

#Preview {
	CameraView(selectedImage: .constant(nil))
}
