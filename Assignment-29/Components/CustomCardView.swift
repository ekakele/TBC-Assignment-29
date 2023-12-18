//
//  CustomCardView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

struct CustomCardView: View {
    // MARK: - Properties
    var image: String
    var title: String
    var brand: String
    var price: Int
    var discount: Double
    var rating: Double
    
    // MARK: - Body
    var body: some View {
        VStack {
            itemImageView
            Spacer()
            shortDescriptionStackView
        }
        .frame(width: 150, height: 200)
        .padding(.all, 12)
        .background(Color(red: 0.95, green: 0.96, blue: 0.97))
        .cornerRadius(12)
        .overlay {
            LabelsStackView
        }
    }
    
    // MARK: - ImageView
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
        Image(image)
            .resizable()
        //            .aspectRatio(contentMode: .fill)
            .scaledToFill()
            .frame(width: 120, height: 120, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    // MARK: - ShortDescription
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
}

#Preview {
    CustomCardView(image: "testImage", title: "Watch", brand: "Apple", price: 200, discount: 20.2, rating: 4.9)
}
