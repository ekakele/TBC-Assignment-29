//
//  ProductDetailsView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

struct ProductDetailsView: View {
    // MARK: - Properties
    @EnvironmentObject var navigator: Navigator
    @EnvironmentObject var viewModel: ProductsViewModel
    
    var images: [String]
    var title: String
    var brand: String
    var price: Int
    var discount: Double
    var rating: Double
    var description: String
    
    var product: Product
    
    // MARK: - Body
    var body: some View {
        VStack {
            ImageCarouselView(images: images)
            Spacer()
            HStack(alignment: .top) {
                descriptionStackView
                Spacer()
            }
            
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 300)
        .overlay {
            LabelsStackView
        }
    }
    
    var LabelsStackView: some View {
        ZStack {
            VStack() {
                HStack {
                    Spacer()
                    DiscountLabelView(discountPercentage: discount)
                }
                Spacer()
            }
            
            VStack() {
                HStack {
                    Spacer()
                    RatingLabelView(rating: rating)
                }
                Spacer().frame(height: 300)
            }
        }
        .padding(.vertical, 16)
        .padding(.trailing, 8)
    }
    
    var descriptionStackView: some View {
        VStack(alignment: .leading) {
            titleSubtitleView
            priceView
            Spacer()
            Text(description)
                .font(.system(size: 18))
                .lineLimit(6)
        }
    }
    
    var titleSubtitleView: some View {
        TitleSubtitleStackView(
            title: title,
            subTitle: brand
        )
    }
    
    var priceView: some View {
        PriceView(price: price)
    }
}

#Preview {
    ProductDetailsView(images: ProductMockData.previewExample.images, title: "Item", brand: "Apple", price: 200, discount: 18.8, rating: 4.4, description: "Item", product: ProductMockData.previewExample)
}
