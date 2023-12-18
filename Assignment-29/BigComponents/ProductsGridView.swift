//
//  ProductsGridView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

struct ProductsGridView: View {
    // MARK: - Properties
    @EnvironmentObject var viewModel: MainViewModel
    @State var path = NavigationPath()
    
    var columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    // MARK: - Body
    var body: some View {
        verticalScrollView
    }
    
    private var verticalScrollView: some View {
        ScrollView(showsIndicators: false) {
            productsGrid
        }
    }
    
    private var productsGrid: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(viewModel.products) { product in
                productLink(product: product)
            }
        }
    }
    
    private func productLink(product: Product) -> some View {
        NavigationLink(value: product, label: {
            CustomCardView(
                image: product.thumbnail,
                title: product.title,
                brand: product.brand,
                price: product.price,
                discount: product.discountPercentage,
                rating: product.rating
            )
        })
        //        .navigationDestination(for: Destination.self) {
        //            ProductDetailView(viewModel: DestinationDetailViewModel(destination: $0, path: $path))
        //        }
    }
}

#Preview {
    ProductsGridView().environmentObject(MainViewModel())
}
