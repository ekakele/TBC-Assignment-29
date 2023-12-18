//
//  RatingLabelView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

struct RatingLabelView: View {
    // MARK: - Properties
    var rating: Double
    var formattedRating: String {
        String(format: "%.1f", rating)
    }

    
    var body: some View {
        // MARK: - Body
        Label(title: {
            Text(formattedRating)
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(.white)
        }) {
            Image(systemName: "star.fill")
                .foregroundStyle(.yellow)
                .font(.system(size: 12))
        }
        .frame(width: 45, height: 20)
        .padding(.horizontal, 6)
        .padding(.vertical, 2)
        .background(.gray.opacity(0.6))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    RatingLabelView(rating: 4.4)
}
