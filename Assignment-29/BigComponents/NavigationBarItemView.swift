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
    
    var body: some View {
        ImageView
    }
    
    var ImageView: some View {
        Image(systemName: systemImageName)
            .resizable()
            .scaleEffect(scaleEffect)
            .aspectRatio(contentMode: .fit)
            .opacity(0.8)
    }
}

#Preview {
    NavigationBarItemView(systemImageName: "heart")
}
