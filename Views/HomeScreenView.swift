//
//  OnboardingView.swift
//  TuringSchool
//
//  Created by Danielly Santos Lopes da Silva on 10/04/23.
//


//I would like the application to run on iPads in landscape mode.

import SwiftUI

struct HomeScreenView: View {
    
    @State private var showModal = false
    @State private var showButton = false
    @State private var opacity: Double = 0.0
    @State private var rectanglePosition = CGPoint(x: 0, y: 0)
    
    
    
    var fontM32 = UIFont()
    var fontMoBo = UIFont()
    var fontMoBoTitle = UIFont()
    
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                ZStack(alignment: .bottom) {
                    
                    
                    
                    Image("floor")
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image("school")
                    //.resizable()
                        .alignmentGuide(.top) { d in d[.top] }
                        .alignmentGuide(.leading) { d in d[.leading] }
                        .offset(x: -geometry.size.width / 2.60 + 20, y: 169)
                    
                    
                   
                    
                    GifView().offset(x: rectanglePosition.x, y: rectanglePosition.y)
                        .animation(.linear(duration: 5))
                        .onAppear {
                            self.rectanglePosition = CGPoint(x: -geometry.size.width / 1.5, y: 0)
                        }
                        .alignmentGuide(.trailing) { d in d[.trailing] }
                        .offset(x: geometry.size.width / 2.60,  y: -143)
                       
                        .onAppear{
                            music(music: "sound")
                        }
                    
                }
                
                Text("Turing School").font(Font(fontMoBoTitle)).foregroundColor(.white)
                    .opacity(opacity)
                    .animation(.easeInOut(duration: 1.5))
                    .onAppear {
                        withAnimation {
                            self.opacity = 1.0                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
                            withAnimation{
                                self.showButton = true
                            }
                        }
                    }
                
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.17)

                if showButton {
                    Button(action: {
                        showModal = true
                    }) {
                        Image("play-button")
                    }
                    .frame(width: 100, height: 100)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    .edgesIgnoringSafeArea(.all)
                    .fullScreenCover(isPresented: $showModal) {
                        OnboardingOneView()
                            .transition(.move(edge: .top))
                            .animation(.easeOut(duration: 0.5))
                    }
                }
               
                
                
            }
        }
        .background(Image("sky").resizable().scaledToFill())
        .edgesIgnoringSafeArea(.all)
        
        
    }
    
    
    init() {
        
        
        
        let cfURL4 = Bundle.main.url(forResource: "PixelOperatorMonoHB8", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL4, CTFontManagerScope.process, nil)
        
        fontM32 = UIFont(name: "PixelOperatorMonoHB8", size: 24)!
        fontMoBo = UIFont(name: "PixelOperatorMonoHB8", size: 30)!
        fontMoBoTitle = UIFont(name: "PixelOperatorMonoHB8", size: 50)!
        
        
    }
    
    
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
