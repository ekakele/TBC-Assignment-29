//
//  ProductsViewModel.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 19.12.23.
//

import SwiftUI

import Foundation
import GenericNetworkManager

// MARK: - Enum
enum checkoutStatus {
    case success
    case failure
    case emptyCart
}

final class ProductsViewModel: ObservableObject {
    // MARK: - Properties
    private var networkManager: GenericNetworkManager
    @Published var products: [Product] = []
    @Published var cartItems: [CartItem] = []
    @Published var creditCardBalance = 3500.0
    @Published var showAlert = false
    @Published var status: checkoutStatus = .emptyCart
    
    var totalQuantityInCart: Int {
        cartItems.reduce(0) { $0 + $1.quantity }
    }
    
    var alertTitle: String {
        switch status {
        case .success:
            return "Payment Success"
        case .failure:
            return "Payment Declined"
        case .emptyCart:
            return "Empty Cart"
        }
    }
    
    var alertMessage: String {
        switch status {
        case .success:
            return "Your purchase has been successfully processed. Thank you for your purchase!"
        case .failure:
            return "Payment declined. Insufficient funds. Please ensure your account has enough balance and try again."
        case .emptyCart:
            return "Your Cart is empty. Add items before checkout."
        }
    }
    
    var totalPrice: Double {
        cartItems.reduce(0) { $0 + (Double($1.product.price) * Double($1.quantity)) }
    }
    
    // MARK: - Init
    init() {
        self.networkManager = GenericNetworkManager(baseURL: "https://dummyjson.com/")
        fetchData()
    }
    
    //MARK: - Methods
    func fetchData() {
        networkManager.fetchData(endpoint: "products") { (result: Result<ProductsData, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.products = data.products
                }
            case .failure(let error):
                print("Error fetching items: \(error.localizedDescription)")
            }
        }
    }
    
    func checkout(completion: @escaping (checkoutStatus) -> Void) {
        let totalPrice = self.totalPrice
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if self.cartItems.isEmpty {
                completion(.emptyCart)
            } else if self.creditCardBalance >= totalPrice {
                self.creditCardBalance -= totalPrice
                self.cartItems.removeAll()
                completion(.success)
            } else {
                completion(.failure)
            }
        }
    }
    
    func addToCart(product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product == product }) {
            cartItems[index].quantity += 1
        } else {
            let newCartItem = CartItem(product: product, quantity: 1)
            cartItems.append(newCartItem)
        }
    }
    
    func filterByCategory(category: String) -> [Product] {
        return products.filter { $0.category.lowercased() == category.lowercased() }
    }
}
