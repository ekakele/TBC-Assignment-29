//
//  DiscountLabelView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

struct DiscountLabelView: View {
    // MARK: - Properties
    var discountPercentage: Double
    var formattedDiscountPercentage: String {
        String(format: "%.1f", discountPercentage)
    }
    
    // MARK: - Body
    var body: some View {
        Text(String("\(formattedDiscountPercentage)%"))
            .font(.system(size: 10, weight: .bold))
            .foregroundStyle(.white)
            .frame(width: 40, height: 20)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(Color.red.opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    DiscountLabelView(discountPercentage: 15.55)
}
