//
//  CategoriesView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

struct CategoriesView: View {
    // MARK: - Properties
    @EnvironmentObject var navigator: Navigator
    @EnvironmentObject var viewModel: ProductsViewModel
    
    // MARK: - Body
    var body: some View {
        categoryList
            .navigationTitle("Shop By Categories")
    }
    
    private var categoryList: some View {
        let uniqueCategories = viewModel.products
            .map { $0.category }
            .reduce(into: Set<String>()) { $0.insert($1) }
            .sorted()
        
        return List {
            ForEach(uniqueCategories, id: \.self) { category in
                productCategoryLink(category: category)
                    .frame(height: 40)
            }
        }
    }
    
    private func productCategoryLink(category: String) -> some View {
        NavigationLink(value: category, label: {
            LabeledContent {
            } label: {
                Text(category)
                    .font(.system(size: 20))
            }
            .onTapGesture {
                navigator.navigate(to: .productsView(category: category))
            }
        })
    }
}

#Preview {
    CategoriesView().environmentObject(ProductsViewModel())
}
