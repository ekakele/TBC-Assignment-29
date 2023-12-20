//
//  MainView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

struct MainView: View {
    // MARK: - Properties
//    @State var path = NavigationPath()
    @EnvironmentObject private var navigator: Navigator

    
    @EnvironmentObject var viewModel: MainViewModel
    @State var paymentInProgress = false
    
    
    // MARK: - Body
    var body: some View {
        navigationStack
    }
    
    private var navigationStack: some View {
        //NavigationStack() {
            ZStack(alignment: .bottom) {
                VStack {
                    CreditCardView(balance:  "\(viewModel.creditCardBalance)$", totalPrice: "\(viewModel.totalPrice)$")
                    ProductsGridView()
                        .navigationBarItems(
                            leading: BalanceBarItemView,
                            trailing: CartBarItemView
                        )
                        .navigationTitle("Online Store")
                        .navigationBarTitleDisplayMode(.inline)
                }
                checkoutButton
            }
        //}
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
        NavigationBarItemView(systemImageName: "line.3.horizontal")
    }
    
    private var checkoutButton: some View {
        Button {
            viewModel.checkout { status in
                viewModel.status = status
                paymentInProgress.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    viewModel.showAlert.toggle()
                    paymentInProgress.toggle()
                }
            }
        } label: {
            if paymentInProgress == true {
                
                Button {
                } label: {
                    ProgressView("Payment in progress")
                        .tint(.white)
                        .frame(width: 200, height: 60)
                        .background(Color(red: 0.86, green: 0.19, blue: 0.13))
                        .foregroundColor(.white)
                        .bold()
                        .cornerRadius(10)
                        .padding(.vertical, 5)
                }
            } else {
                Text("Checkout")
                    .frame(width: 140, height: 60)
                    .background(Color(red: 0.86, green: 0.19, blue: 0.13))
                    .foregroundColor(.white)
                    .bold()
                    .cornerRadius(10)
                    .padding(.vertical, 5)
            }
        }
        .alert(isPresented: $viewModel.showAlert, content: {
            Alert(
                title: Text(viewModel.alertTitle),
                message: Text(viewModel.alertMessage)
            )
        })
        .disabled(paymentInProgress)
    }
}

#Preview {
    
    NavigationStack {
        MainView().environmentObject(MainViewModel())
    }
   
}
