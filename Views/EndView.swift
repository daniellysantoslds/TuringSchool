//
//  SwiftUIView.swift
//  
//
//  Created by Danielly Santos Lopes da Silva on 18/04/23.
//

import SwiftUI

struct EndView: View {
    
    var fontR = UIFont()
    var fontB = UIFont()
    var fontM = UIFont()
    var fontR28 = UIFont()
    var fontM32 = UIFont()
    var fontMoBo = UIFont()
    
    @State private var showModal = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                
                Text("The Turing Machine is a theoretical device composed of an infinite tape and used as an input, output and working memory device together. The invention laid the theoretical foundations for the development of modern computers. Without it, we would not have access to one of the most important devices in the world today: the computer.").font(Font(fontMoBo)).foregroundColor(.white
                )
                
                Text(" Alan Turing, known as the father of computing, is of indisputable importance to the development of computer science. Sadly, during his lifetime, much of his work went unrecognized, but today we owe him a great deal. Long live Alan Turing and long live science!")
        
                
                
                Button(action: {
                    showModal = true
                }) {
                    Image("27")
                }
                .frame(width: 100, height: 100)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                .fullScreenCover(isPresented: $showModal) {
                    HomeScreenView()
                        .transition(.move(edge: .top))
                        .animation(.easeOut(duration: 0.10))
                }
                
                
                Button(action: {
                    showModal = true
                }) {
                    Image("credits-button")
                }
                .frame(width: 100, height: 100)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 6)
                
                
            }
            
        }.background(Image("frame-straight").resizable()
            .scaledToFill())

        
    }
    
    
    init() {
        let cfURL = Bundle.main.url(forResource: "PixelOperator-Bold", withExtension: "ttf")! as CFURL
        
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        let cfURL2 = Bundle.main.url(forResource: "PixelOperator", withExtension: "ttf")! as CFURL
        
        CTFontManagerRegisterFontsForURL(cfURL2, CTFontManagerScope.process, nil)
        let cfURL3 = Bundle.main.url(forResource: "PixelOperatorMono8", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL3, CTFontManagerScope.process, nil)
        
        fontR = UIFont(name: "PixelOperator-Bold", size:  180)!
        fontB = UIFont(name: "PixelOperator", size:  80)!
        fontM = UIFont(name: "PixelOperatorMono8", size: 80)!
        fontM = UIFont(name: "PixelOperatorMono8", size: 80)!
        fontR28 = UIFont(name: "PixelOperator", size: 28)!
        fontM32 = UIFont(name: "PixelOperatorMono8", size: 18)!
        fontM32 = UIFont(name: "PixelOperatorMono8", size: 18)!
        fontMoBo = UIFont(name: "PixelOperatorMonoHB8", size: 30)!
        
        
        
    }
    
    
}







struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView()
    }
}
