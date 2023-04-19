//
//  SwiftUIView.swift
//  
//
//  Created by Danielly Santos Lopes da Silva on 18/04/23.
//

import SwiftUI

struct EndView: View {
    
    var fontMoBo = UIFont()
    
    @State private var showHomeModal = false
    @State private var showCreditsModal = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(alignment: .center, spacing: 0) {
                    
                    
                    Text("As we saw in class, the Machine is a device composed of an infinite tape, it was the first abstract model of a computer. That's it class, did you like the class? We will always remember that it was thanks to this invention that the computers we use today were developed").font(Font(fontMoBo)).foregroundColor(.white).multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                    
                    Text("Alan Turing, known as the father of computing, played a key role in the development of computer science. Sadly, during his lifetime, much of his work went unrecognized, but today we owe him a great deal. Long live Alan Turing and long live science!").font(Font(fontMoBo)).foregroundColor(.white).multilineTextAlignment(.center)
                    
                    HStack {
                        Button(action: {
                            showHomeModal = true
                        }) {
                            Image("restart-button")
                        }
                        .position(x: geometry.size.width * 0.2 , y: geometry.size.height / 4)
                        .fullScreenCover(isPresented: $showHomeModal) {
                            HomeScreenView()
                                .transition(.move(edge: .top))
                                .animation(.easeOut(duration: 0.10))
                        }
                        
                        
                        Button(action: {
                            showCreditsModal = true
                        }) {
                            Image("credits-button")
                        }
                        .position(x: geometry.size.width * 0.3, y: geometry.size.height / 4 ).fullScreenCover(isPresented: $showCreditsModal) {
                            CreditsView()
                                .transition(.move(edge: .top))
                                .animation(.easeOut(duration: 0.10))
                        }
                        
                    }
                    
                    
                }.padding(.horizontal, 32).padding(.top, 100)
            }
        }.background(Image("frame-straight").resizable()
            .scaledToFill())
    }
    
    init() {
        
        let cfURL4 = Bundle.main.url(forResource: "PixelOperatorMonoHB8", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL4, CTFontManagerScope.process, nil)
        
        fontMoBo = UIFont(name: "PixelOperatorMonoHB8", size: 26)!
        
    }
    
    
    struct EndView_Previews: PreviewProvider {
        static var previews: some View {
            EndView()
        }
    }
}
