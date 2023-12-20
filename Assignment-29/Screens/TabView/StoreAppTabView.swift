//
//  StoreAppTabView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

struct StoreAppTabView: View {
    // MARK: - Properties
    @EnvironmentObject var viewModel: ProductsViewModel
    
    // MARK: - Body
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "storefront")
                    Text("Shop")
                }
            
            CategoriesView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Categories")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    StoreAppTabView().environmentObject(ProductsViewModel())
}
