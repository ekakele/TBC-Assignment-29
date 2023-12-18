//
//  CategoriesView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

struct CategoriesView: View {
    // MARK: - Properties
    @EnvironmentObject var viewModel: MainViewModel
    @State var path = NavigationPath()
    
    // MARK: - Body
    var body: some View {
        navigationStack
    }
    
    private var navigationStack: some View {
        NavigationStack(path: $path) {
            categoryList
                .navigationTitle("Shop By Categories")
        }
        
    }
    
    private var categoryList: some View {
        let uniqueCategories = viewModel.products
            .map { $0.category }
            .reduce(into: Set<String>()) { $0.insert($1) }
            .sorted()
        
        return List {
            ForEach(uniqueCategories, id: \.self) { category in
                productCategoryLink(category: category)
            }
        }
    }
    
    private func productCategoryLink(category: String) -> some View {
        NavigationLink(value: category, label: {
            Text(category)
                .font(.system(size: 20))
        })
        //        .navigationDestination(for: Destination.self) {
        //            ProductDetailView(viewModel: DestinationDetailViewModel(destination: $0, path: $path))
        //        }
    }
}




#Preview {
    CategoriesView().environmentObject(MainViewModel())
}
