//
//  Assignment_29App.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

@main
struct Assignment_29App: App {
    @State var viewModel = MainViewModel()

    var body: some Scene {
        WindowGroup {
            StoreAppTabView()
                .environmentObject(viewModel)
        }
    }
}
