//
//  PriceView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

struct PriceView: View {
    // MARK: - Properties
    var price: Int
    var priceFont: CGFloat = 20
    var priceWeight: Font.Weight = .bold
    var alignmentAxe: Alignment = .leading
    
    // MARK: - Body
    var body: some View {
        Text("\(price)$")
            .font(.system(size: priceFont, weight: priceWeight))
            .frame(maxWidth: .infinity, alignment: alignmentAxe)
            .foregroundColor(.green)
    }
}

#Preview {
    PriceView(price: 200)
}
