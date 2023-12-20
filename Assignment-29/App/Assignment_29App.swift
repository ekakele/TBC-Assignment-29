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
//                    case .productsView:
//
                    case .productDetails(let product):
                        ProductDetailsView(product: product)
                    }
                }
            }
            .environmentObject(navigator)
            .environmentObject(viewModel)
        }
    }
}
