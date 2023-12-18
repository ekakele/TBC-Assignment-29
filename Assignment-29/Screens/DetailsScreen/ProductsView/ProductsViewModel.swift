//
//  ProductsViewModel.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 19.12.23.
//

import SwiftUI


final class ProductsViewModel: ObservableObject {
    // MARK: - Properties
    let product: Product
    @Binding var path: NavigationPath
    
    // MARK: - Init
    init(product: Product, path: Binding<NavigationPath>) {
        self.product = product
        self._path = path
    }
}
