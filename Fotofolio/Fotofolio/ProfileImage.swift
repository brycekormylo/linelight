//
//  ProfileImage.swift
//  Fotofolio
//
//  Created by Bryce on 10/19/23.
//

import SwiftUI

struct ProfileImage: View {
    
    let image: URL
    let size: CGFloat
    let clipShape: any Shape
    
    init(_ image: URL = URL(string: "https://source.unsplash.com/random/300x300/?person,profile")!, size: CGFloat = 100, clipShape: any Shape = Circle()) {
        self.image = image
        self.size = size
        self.clipShape = clipShape
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .frame(width: size+15, height: size+15)
            AsyncImage(url: image)
                .frame(width: size, height: size)
                .clipShape(Circle())
        }
    }
}
