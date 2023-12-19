//
//  CreditCardView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 19.12.23.
//

import SwiftUI

struct CreditCardView: View {
    var balance: String
    var totalPrice: String
    
    var body: some View {
        
        RoundedRectangleView
            .padding()
            .overlay {
                VStack(alignment: .leading) {
                    ImageBalanceView
                    TextView
                }
            }
    }
    
    var RoundedRectangleView: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(red: 0.99, green: 0.95, blue: 0.94))
            .frame(width: .infinity, height: 200)
            .padding(.horizontal, 20)
            .shadow(radius: 10)
    }
    
    var ImageBalanceView: some View {
        ImageView
            .overlay(
                alignment: .leading) {
                    Text(balance)
                        .bold()
                        .font(.title)
                        .foregroundColor(.white)
                        .offset(x: 46, y: -8)
                }
    }
    
    var ImageView: some View {
        Image("creditCard")
            .resizable()
            .frame(width: 300, height: 150)
            .scaledToFit()
            .padding(.horizontal, 20)
            .shadow(radius: 10)
    }
    
    var TextView: some View {
        Text("Total: \(totalPrice)")
            .foregroundColor(Color(red: 0.86, green: 0.19, blue: 0.13))
            .padding(.horizontal, 30)
            .frame(width: .infinity, alignment: .leading)
            .font(.title3)
            .bold()
    }
    
    
}

#Preview {
    CreditCardView(balance: "3500$", totalPrice: "2000$")
}
