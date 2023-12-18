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
    
    // MARK: - Init
    init() {
        self.networkManager = GenericNetworkManager(baseURL: "https://dummyjson.com/")
        fetchData()
    }
    
    // MARK: - Network Call
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
}
