//
//  Grids.swift
//  Assignment-29
//
//  Created by Eka Kelenjeridze on 18.12.23.
//

import SwiftUI

struct Grids: View {
    let columns: [GridItem] = [
        //column spacing
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
    ]
    
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(Color.orange)
                .frame(height: 300)
            
            
            LazyVGrid(
                columns: columns,
                alignment: .center,
                //row spacing
                spacing: 6,
                pinnedViews: [.sectionHeaders],
                content: {
                    
                    Section {
                        ForEach(0..<9) { index in
                            Rectangle()
                                .frame(height: 150)
                        }
                    } header: {
                        Text("Section 1")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.blue)
                    }
                    
                    Section {
                        ForEach(0..<9) { index in
                            Rectangle()
                                .frame(height: 150)
                        }
                    } header: {
                        Text("Section 2")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.green)
                    }
                }
            )
            
            //            LazyVGrid(columns: columns) {
            //                ForEach(0..<50) { index in
            //                    Rectangle()
            //                        .frame(height: 150)
            //                }
            //            }
        }
    }
}

#Preview {
    Grids()
}
