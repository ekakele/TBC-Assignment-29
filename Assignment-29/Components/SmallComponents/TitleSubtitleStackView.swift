//
//  TitleSubtitleStackView.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

struct TitleSubtitleStackView: View {
    // MARK: - Properties
    var title: String
    var subTitle: String
    var titleFont: CGFloat = 18
    var subTitleFont: CGFloat = 16
    var alignmentAxe: HorizontalAlignment = .leading
    var titleWeight: Font.Weight = .bold
    var subTitleWeight: Font.Weight = .regular
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: alignmentAxe) {
            Text(title)
                .font(.system(size: titleFont, weight: titleWeight))
                .foregroundColor(.black)
            
            Text(subTitle)
                .font(.system(size: subTitleFont, weight: subTitleWeight))
                .foregroundColor(.gray)
        }
        .padding(.bottom, 2)
    }
}

#Preview {
    TitleSubtitleStackView(title: "Title", subTitle: "Subtitle" , titleFont: 18, subTitleFont: 16, alignmentAxe: .leading, titleWeight: .bold, subTitleWeight: .regular)
}
