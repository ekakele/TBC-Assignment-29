//
//  ImageCarouselView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 20.12.23.
//

import SwiftUI


struct ImageCarouselView: View {
    // MARK: - Properties
    @State private var selectedImageIndex = 0
    var images: [String]
    
    // MARK: - Body
    var body: some View {
        VStack {
            imageTabView
            indicatorHStack
        }
    }
    
    // MARK: - Components
    private var imageTabView: some View {
        TabView(selection: $selectedImageIndex) {
            ForEach(0..<images.count, id: \.self) { index in
                fetchImages(images[index])
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: 280)
        .onAppear {
            selectedImageIndex = 0
        }
    }
    
    private var indicatorHStack: some View {
        HStack {
            Spacer()
            ForEach(0..<images.count, id: \.self) { index in
                Circle()
                    .fill(index == selectedImageIndex ? Color.primary : Color.secondary)
                    .frame(width: 8, height: 8)
            }
            Spacer()
        }
    }
    
    private func fetchImages(_ imageURL: String) -> some View {
        return AsyncImage(
            url: URL(string: imageURL),
            content: { fetchedImage in
                fetchedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: .infinity, height: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                
            }, placeholder: {
                ProgressView()
            })
    }
}

#Preview {
    ImageCarouselView(images: ProductMockData.previewExample.images)
}
