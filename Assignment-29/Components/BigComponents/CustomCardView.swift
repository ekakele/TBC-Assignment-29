//
//  CustomCardView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

struct CustomCardView: View {
    // MARK: - Properties
    @EnvironmentObject var viewModel: ProductsViewModel
    @EnvironmentObject var navigator: Navigator
    
    var image: String
    var title: String
    var brand: String
    var price: Int
    var discount: Double
    var rating: Double
    
    var product: Product
    
    // MARK: - Body
    var body: some View {
        VStack {
            itemImageView
            Spacer()
            HStack(alignment: .top) {
                shortDescriptionStackView
                Spacer()
                addToCartButton {
                    viewModel.addToCart(product: product)
                }
            }
        }
        .frame(width: 150, height: 200)
        .padding(.all, 12)
        .background(Color(red: 0.95, green: 0.96, blue: 0.97))
        .cornerRadius(12)
        .overlay {
            LabelsStackView
        }
    }
    
    // MARK: - Components
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
                Spacer()
                
                HStack {
                    Spacer()
                    RatingLabelView(rating: rating)
                }
            }
        }
        .padding(.vertical, 16)
        .padding(.trailing, 8)
    }
    
    private var itemImageView: some View {
        fetchImage()
    }
    
    private func fetchImage() -> some View {
        let imageURL = URL(string: image)
        
        return AsyncImage(
            url: imageURL,
            content: { fetchedImage in
                fetchedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 120, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
            }, placeholder: {
                ProgressView()
            })
    }
    
    private var shortDescriptionStackView: some View {
        VStack(alignment: .leading) {
            titleSubtitleView
            priceView
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
    
    private func addToCartButton(action: @escaping () -> Void) -> some View {
        Button {
            viewModel.addToCart(product: product)
        } label: {
            Text("🛒")
                .frame(width: 44, height: 30, alignment: .center)
                .background(.yellow.opacity(0.8))
                .foregroundColor(.white)
                .bold()
                .cornerRadius(10)
                .padding(.vertical, 5)
        }
    }
}

#Preview {
    CustomCardView(image: "https://i.dummyjson.com/data/products/8/thumbnail.jpg", title: "Watch", brand: "Apple", price: 200, discount: 20.2, rating: 4.9, product: ProductMockData.previewExample)
}
