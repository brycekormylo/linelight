//
//  SlidingImage.swift
//  Samples
//
//  Created by Bryce on 10/19/23.
//

import SwiftUI

struct SlidingImage: View {
    let url: URL
    let initialHeight: CGFloat
    @State private var isExpanded: Bool = false
    @EnvironmentObject var imageSliderController: ImageSliderController
    
    init(_ url: URL = sampleImages[0], startingHeight: CGFloat = 0) {
        self.url = url
        self.initialHeight = startingHeight
    }
    
    var body: some View {
        GeometryReader { geo in
            AsyncImage(url: url) { result in
                ZStack {
                    Color.clear
                        .background(
                            result.image?
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: initialHeight * 2.5)
                                .offset(CGSize(width: 0, height: -(geo.frame(in: .global).midY/2 - initialHeight * (2/3))))
                        )
                        .mask {
                            RoundedRectangle(cornerRadius: 24)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation {
                                if isExpanded {
                                    imageSliderController.minimizeAll()
                                } else {
                                    imageSliderController.expandImage(withURL: self.url)
                                }
                            }
                        }
                }
            }
        }
        .modifier(AnimatingCellHeight(height: isExpanded ? initialHeight * 5/3 : initialHeight))
        .onReceive(imageSliderController.$expandedImage) { expandedImage in
            withAnimation {
                if let expandedURL = imageSliderController.expandedImage, expandedURL == url {
                    self.isExpanded = true
                } else {
                    self.isExpanded = false
                }
            }
        }
    }
}

struct AnimatingCellHeight: AnimatableModifier {
    var height: CGFloat = 0
    
    var animatableData: CGFloat {
        get { height }
        set { height = newValue }
    }
    
    func body(content: Content) -> some View {
        content.frame(height: height)
    }
}

#Preview {
    SlidingImage()
}
