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
    }
    
    private var navigationStack: some View {
        NavigationStack(path: $path) {
            ZStack(alignment: .bottom) {
                VStack {
                    CreditCardView(balance:  "\(viewModel.creditCardBalance)$", totalPrice: "\(viewModel.totalPrice)$")
                    ProductsGridView()
                        .navigationBarItems(
                            leading: BalanceBarItemView,
                            trailing: CartBarItemView
                        )
                    //                        .toolbar {
                    //                            ToolbarItem(placement: .principal) {
                    //                                Text("Online Store")
                    //                                    .font(.title3)
                    //                                    .bold()
                    //                            }
                    //                        }
                }
                checkoutButton
            }
        }
    }
    
    private var CartBarItemView: some View {
        NavigationBarItemView(systemImageName: "cart")
            .overlay(
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.orange)
                    .offset(x: 10, y: -10)
                    .overlay(
                        Text("\(viewModel.cartItems.count)")
                            .font(.system(size: 15))
                            .bold()
                            .foregroundColor(.white)
                            .offset(x: 10, y: -10)
                    )
            )
    }
    
    private var BalanceBarItemView: some View {
        NavigationBarItemView(systemImageName: "person")
    }
    
    private var checkoutButton: some View {
        Button {
            viewModel.checkout { status in
                switch status {
                case .successfulPayment:
                    viewModel.alertTitle = "Payment Success"
                    viewModel.alertMessage = CheckoutStatus.successfulPayment.rawValue
                case .paymentDeclined:
                    viewModel.alertTitle = "Payment Declined"
                    viewModel.alertMessage = CheckoutStatus.paymentDeclined.rawValue
                }
                viewModel.showAlert.toggle()
            }
        } label: {
            Text("Checkout")
                .frame(width: 140, height: 60)
                .background(Color(red: 0.86, green: 0.19, blue: 0.13))
                .foregroundColor(.white)
                .bold()
                .cornerRadius(10)
                .padding(.vertical, 5)
        }
        .alert(isPresented: $viewModel.showAlert, content: {
            Alert(
                title: Text(viewModel.alertTitle),
                message: Text(viewModel.alertMessage)
            )
        })
    }

    
}

#Preview {
    MainView().environmentObject(MainViewModel())
}
