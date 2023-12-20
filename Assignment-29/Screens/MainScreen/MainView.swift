//
//  MainView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

struct MainView: View {
    // MARK: - Properties
    @EnvironmentObject private var navigator: Navigator
    @EnvironmentObject var viewModel: ProductsViewModel
    
    // MARK: - Body
    var body: some View {
        ProductsView()
    }
}

#Preview {
    MainView().environmentObject(ProductsViewModel())
}
