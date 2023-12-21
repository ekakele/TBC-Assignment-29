//
//  ProductsGridView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

struct ProductsGridView: View {
    // MARK: - Properties
    @EnvironmentObject var navigator: Navigator
    var products: [Product]
    var columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    // MARK: - Body
    var body: some View {
        verticalScrollView
    }
    
    // MARK: - Components
    private var verticalScrollView: some View {
        ScrollView(showsIndicators: false) {
            productsGrid
        }
    }
    
    private var productsGrid: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(products) { product in
                productLink(product: product)
            }
        }
    }
    
    private func productLink(product: Product) -> some View {
        NavigationLink(value: product) {
            CustomCardView(
                image: product.thumbnail,
                title: product.title,
                brand: product.brand,
                price: product.price,
                discount: product.discountPercentage,
                rating: product.rating,
                product: product
            )
            .onTapGesture {
                navigator.navigate(to: .productDetails(product: product))
            }
        }
    }
}

#Preview {
    ProductsGridView(products: [ProductMockData.previewExample])
}
