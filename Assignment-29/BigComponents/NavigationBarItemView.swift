//
//  NavigationBarItemView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 19.12.23.
//

import SwiftUI

struct NavigationBarItemView: View {
    var systemImageName: String
    var scaleEffect: CGFloat = 1.3
    var text: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .scaleEffect(scaleEffect)
            .aspectRatio(contentMode: .fit)
            .opacity(0.8)
            .overlay(
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.red.opacity (0.8))
                    .offset(x: 10, y: -10)
                    .overlay(
                        Text(text)
                            .font(.system(size: 15))
                            .bold()
                            .foregroundColor(.white)
                            .offset(x: 10, y: -10)
                    )
            )
    }
}

#Preview {
    NavigationBarItemView(systemImageName: "heart", text: "3")
}
