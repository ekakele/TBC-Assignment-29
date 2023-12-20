//
//  CartItemModel.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 19.12.23.
//

import Foundation

// MARK: - CartItem
struct CartItem: Decodable, Hashable {
    var product: Product
    var quantity: Int = 0
}
