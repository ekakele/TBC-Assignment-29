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
    @State var path = NavigationPath()

    
    // MARK: - Body
    var body: some View {
        navigationStack
    }
    
    private var navigationStack: some View {
        NavigationStack(path: $path) {
            ProductsGridView()
                .navigationTitle("Product Category")
//                .navigationTitle("\(product.category)")
        }
    }
}

#Preview {
    ProductsView(viewModel: ProductsViewModel(product: ProductMockData.previewExample, path: ProductMockData().$path)).environmentObject(MainViewModel())
}
