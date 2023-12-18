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
    
    // MARK: - Body
    var body: some View {
        navigationStack
        checkoutButton
    }
    
    private var navigationStack: some View {
        NavigationStack(path: $path) {
            ProductsGridView()
                .navigationTitle("Online Store")
                .navigationBarItems(
                    leading: BalanceBarItemView,
                    trailing: CartBarItemView
                )
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("3 items, 33$ total")
                            .font(.title3)
                            .bold()
                    }
                }
        }
    }
    
    private var CartBarItemView: some View {
        NavigationBarItemView(systemImageName: "cart", text: "3")
    }
    
    private var BalanceBarItemView: some View {
        NavigationBarItemView(systemImageName: "creditcard", text: "3")
    }
    
    private var checkoutButton: some View {
        Button {
            
        } label: {
            Text("Checkout")
                .frame(width: 200, height: 60)
                .background(Color(red: 0.86, green: 0.19, blue: 0.13))
                .foregroundColor(.white)
                .bold()
                .cornerRadius(10)
                .padding(.vertical, 5)
        }
    }
}

#Preview {
    MainView().environmentObject(MainViewModel())
}
