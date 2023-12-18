//
//  ProductModel.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import Foundation

// MARK: - Products
struct Products: Decodable, Hashable {
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int
}

// MARK: - Product
struct Product: Decodable, Hashable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}
