//
//  MainView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

struct MainView: View {
    // MARK: - Properties
    @EnvironmentObject var viewModel: MainViewModel
    @State var path = NavigationPath()
    
    private let columns = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible())
    ]
    
    // MARK: - Body
    var body: some View {
        navigationStack
 
    }
    
    private var navigationStack: some View {
        NavigationStack(path: $path) {
            ProductsGridView()
        }
    }
    
}
#Preview {
    MainView().environmentObject(MainViewModel())
}
