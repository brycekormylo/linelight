//
//  BannerImageView.swift
//  Fotofolio
//
//  Created by Bryce on 10/23/23.
//

import SwiftUI

struct BannerImageView: View {
    
    let image: URL
    
    init(_ image: URL = URL(string: "https://source.unsplash.com/random/600x480/?landscape")!) {
        self.image = image
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: image) { result in
                result.image?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
            }
            Spacer()
        }
    }
}

#Preview {
    BannerImageView()
}
