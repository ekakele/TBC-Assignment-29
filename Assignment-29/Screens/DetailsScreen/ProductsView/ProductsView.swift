//
//  ProductsView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 19.12.23.
//

import SwiftUI

struct ProductsView: View {
    // MARK: - Properties
    @StateObject var viewModel: ProductsViewModel
    @EnvironmentObject var mainViewModel: MainViewModel
//    @State var path = NavigationPath()

    
    // MARK: - Body
    var body: some View {
        navigationStack
    }
    
    private var navigationStack: some View {
        NavigationStack() {
            ProductsGridView()
//                .navigationTitle("\(product.category)")
        }
        .navigationDestination(for: Product.self) { product in
            ProductDetailsView(viewModel: ProductDetailViewModel())
        }
    }
}

//#Preview {
//    ProductsView(viewModel: ProductsViewModel(product: ProductMockData.previewExample, path: ProductMockData().$path)).environmentObject(MainViewModel())
//}
