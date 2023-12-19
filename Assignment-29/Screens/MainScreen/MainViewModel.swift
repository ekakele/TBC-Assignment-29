//
//  MainViewModel.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import Foundation
import GenericNetworkManager

final class MainViewModel: ObservableObject {
    // MARK: - Properties
    private var networkManager: GenericNetworkManager
    @Published var products: [Product] = []
    @Published var cartItems: [CartItem] = []
    @Published var creditCardBalance = 3500
    
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
    
    func addToCart(product: Product) {
        if let index = cartItems.firstIndex(where: { $0.product == product }) {
            cartItems[index].quantity += 1
        } else {
            let newCartItem = CartItem(product: product, quantity: 1)
            cartItems.append(newCartItem)
        }
    }
}
