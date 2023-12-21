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
    var product: Product
    
    var images: [String]
    var title: String
    var brand: String
    var price: Int
    var discount: Double
    var rating: Double
    var description: String
    
    // MARK: - Body
    var body: some View {
        VStack {
            ImageCarouselView(images: images)
            descriptionStackView
            Spacer()
            returnToCategoriesButton
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 100)
        .overlay {
            LabelsStackView
        }
    }
    
    private var LabelsStackView: some View {
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
    
    private var descriptionStackView: some View {
        VStack(alignment: .leading) {
            titleSubtitleView
                .padding(.vertical, 5)
            priceView
                .padding(.vertical, 5)
            Text(description)
                .font(.system(size: 18))
                .lineLimit(8)
                .padding(.vertical, 5)
        }
    }
    
    private var titleSubtitleView: some View {
        TitleSubtitleStackView(
            title: title,
            subTitle: brand
        )
    }
    
    private var priceView: some View {
        PriceView(price: price)
    }
    
    private var returnToCategoriesButton: some View {
        Button {
            navigator.navigateToRoot()
        } label: {
            Text("Return")
                .frame(width: 200, height: 60)
                .background(Color(red: 0.86, green: 0.19, blue: 0.13))
                .foregroundColor(.white)
                .bold()
                .cornerRadius(10)
                .padding(.vertical, 5)
        }
    }
}

#Preview {
    ProductDetailsView(product: ProductMockData.previewExample, images: ProductMockData.previewExample.images, title: "Item", brand: "Apple", price: 200, discount: 18.8, rating: 4.4, description: "Item")
}
