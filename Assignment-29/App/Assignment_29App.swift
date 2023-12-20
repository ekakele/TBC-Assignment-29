//
//  Assignment_29App.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

@main
struct Assignment_29App: App {
    // MARK: - Properties
    @ObservedObject var navigator = Navigator()
    @State var viewModel = ProductsViewModel()
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            
            NavigationStack(path: $navigator.navigationPath) {
                StoreAppTabView().navigationDestination(for: Navigator.Destination.self) { destination in
                    switch destination {
                    case .productsView(let category):
                        ProductsView(category: category)
                    case .productDetails(let product):
                        ProductDetailsView(product: product, images: product.images, title: product.title, brand: product.brand, price: product.price, discount: product.discountPercentage, rating: product.rating, description: product.description)
                    }
                }
            }
            .environmentObject(navigator)
            .environmentObject(viewModel)
        }
    }
}
