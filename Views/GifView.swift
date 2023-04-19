//
//  gifview.swift
//  TuringSchool
//
//  Created by Danielly Santos Lopes da Silva on 19/04/23.
//

import SwiftUI
import ImageIO
import MobileCoreServices

struct AnimatedGifView: UIViewRepresentable {
    let images: [UIImage]
    let duration: TimeInterval

    func makeUIView(context: Context) -> UIView {
        let animatedImageView = UIImageView()
        animatedImageView.contentMode = .scaleAspectFit
        return animatedImageView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        guard let imageView = uiView as? UIImageView else { return }
        imageView.animationImages = images
        imageView.animationDuration = duration
        imageView.startAnimating()
    }
}

struct AnimatedGifView_Previews: PreviewProvider {
    static var previews: some View {
        let images = [UIImage(named: "turin_1")!, UIImage(named: "turin_2")!, UIImage(named: "turin_3")!]
        return AnimatedGifView(images: images, duration: 0.5)
    }
}

func createGif(from images: [UIImage], withName name: String, loopCount: Int = 0) {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileURL = documentsDirectory.appendingPathComponent(name)
    if let destination = CGImageDestinationCreateWithURL(fileURL as CFURL, kUTTypeGIF, images.count, nil) {
        let frameProperties = [kCGImagePropertyGIFDictionary as String: [kCGImagePropertyGIFDelayTime as String: 0.1]]
        let gifProperties = [kCGImagePropertyGIFDictionary as String: [kCGImagePropertyGIFLoopCount as String: loopCount]]
        CGImageDestinationSetProperties(destination, gifProperties as CFDictionary)
        for image in images {
            CGImageDestinationAddImage(destination, image.cgImage!, frameProperties as CFDictionary)
        }
        CGImageDestinationFinalize(destination)
    }
}

struct GifView: View {
    let images = [
        UIImage(named: "turin_0")!,
        UIImage(named: "turin_1")!,
        UIImage(named: "turin_2")!,
        UIImage(named: "turin_3")!
    ]

    var body: some View {
        VStack {
            AnimatedGifView(images: images, duration: 0.5)
                .frame(width: 50, height: 50)
                //.border(Color.black)
//            Button("Create GIF") {
//                createGif(from: images, withName: "animated.gif")
//            }
        }
    }
}

struct GifView_Previews: PreviewProvider {
    static var previews: some View {
        GifView()
    }
}
