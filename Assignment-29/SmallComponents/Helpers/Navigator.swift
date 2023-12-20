//
//  Navigator.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 20.12.23.
//

import SwiftUI

final class Navigator: ObservableObject {
    
    // MARK: - Enum
    enum Destination: Decodable, Hashable {
        //        case productsView
        case productDetails(product: Product)
    }
    
    // MARK: - Properties
    @Published var navigationPath = NavigationPath()
    
    // MARK: - Methods
    func navigate(to destination: Destination) {
        navigationPath.append(destination)
    }
    
    func navigateBack() {
        navigationPath.removeLast()
    }
    
    func navigateToRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
    
}

