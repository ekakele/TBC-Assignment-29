//
//  ProductDetailsView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

struct ProductDetailsView: View {
    // MARK: - Properties
    @EnvironmentObject var navigator: Navigator
    var product: Product
    
    // MARK: - Body
    var body: some View {
        Text(product.title)
    }
}

#Preview {
    ProductDetailsView(product: ProductMockData.previewExample)
}
