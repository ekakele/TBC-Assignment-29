//
//  Navigator.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 20.12.23.
//

import SwiftUI

final class Navigator: ObservableObject {
    
    public enum Destination: Decodable, Hashable {
//        case productsView
        case productDetails(product: Product)
    }
    
    @Published var navigationPath = NavigationPath()
    
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

