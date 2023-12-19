//
//  CreditCardView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 19.12.23.
//

import SwiftUI

struct CreditCardView: View {
    var price: String

    var body: some View {
        ImageBalanceView
    }
    
    var ImageBalanceView: some View {
        ImageView
            .overlay(
                alignment: .leading) {
                    Text(price)
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
    
    
}

#Preview {
    CreditCardView(price: "3500$")
}
