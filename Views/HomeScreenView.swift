//
//  OnboardingView.swift
//  TuringSchool
//
//  Created by Danielly Santos Lopes da Silva on 10/04/23.
//

import SwiftUI

struct HomeScreenView: View {
    
    @State private var showModal = false
    
    var fontR = UIFont()
    var fontB = UIFont()
    var fontM = UIFont()
    
    
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
                    
                    Image("turin").frame(width: 150, height:150)
                        .alignmentGuide(.top) { d in d[.top] }
                        .alignmentGuide(.trailing) { d in d[.trailing] }
                        .offset(x: geometry.size.width / 2.60,  y: -118)
                    
                    
                }
                
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
        .background(Image("sky").resizable().scaledToFill())
        .edgesIgnoringSafeArea(.all)
        
        
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
        
        
    }
    
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}


