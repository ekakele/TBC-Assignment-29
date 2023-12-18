//
//  ShopAppTabView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

struct ShopAppTabView: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        TabView {
            
            MainView()
                .tabItem {
                    Image(systemName: "storefront")
                    Text("Shop")
                }
            
            CategoriesView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    ShopAppTabView().environmentObject(MainViewModel())
}
