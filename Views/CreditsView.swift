//
//  SwiftUIView.swift
//  
//
//  Created by Danielly Santos Lopes da Silva on 19/04/23.
//

import SwiftUI

struct CreditsView: View {
    
    var fontMoBo = UIFont()
    
    @State private var showModal = false
    
        var body: some View {
            GeometryReader { geometry in
                ZStack {
                    VStack(alignment: .center, spacing: 0) {
                        
                        
                        Text("As we saw in class, the Machine is a device composed of an infinite tape, it was the first abstract model of a computer. That's it class, did you like the class? We will always remember that it was thanks to this invention that the computers we use today were developed").font(Font(fontMoBo)).foregroundColor(.white).multilineTextAlignment(.center)
                            .padding(.top, 50)
                            .padding(.bottom, 20)
                       
                        HStack {
                            Button(action: {
                                showModal = true
                            }) {
                                Image("restart-button")
                            }
                            .position(x: geometry.size.width * 0.5 , y: geometry.size.height / 4)
                            .fullScreenCover(isPresented: $showModal) {
                                HomeScreenView()
                                    .transition(.move(edge: .top))
                                    .animation(.easeOut(duration: 0.10))
                            }
                            
                        }
                        
                        
                    }
                }
            }.background(Image("frame-straight").resizable()
                .scaledToFill())
        }
        
        init() {
            
            let cfURL4 = Bundle.main.url(forResource: "PixelOperatorMonoHB8", withExtension: "ttf")! as CFURL
            CTFontManagerRegisterFontsForURL(cfURL4, CTFontManagerScope.process, nil)
            
            fontMoBo = UIFont(name: "PixelOperatorMonoHB8", size: 26)!
            
        }
    }


struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
