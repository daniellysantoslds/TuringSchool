//
//  OnboardingView.swift
//  TuringSchool
//
//  Created by Danielly Santos Lopes da Silva on 10/04/23.
//

import SwiftUI

struct OnboardingView: View {
    
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
                
                Image("sprite_0 44")
                //.resizable()
                    .alignmentGuide(.top) { d in d[.top] }
                    .alignmentGuide(.leading) { d in d[.leading] }
                    .offset(x: -geometry.size.width / 2.5 + 20, y: 169)
                //.frame(maxHeight: .infinity, alignment: .bottom)
                
                
            }
            
            
            Button(action: {
                showModal = true
            }) {
                Image("Frame 11")
            }
            
            //            Image("sprite_0 (2)").frame(width: 200, height: 200)
            
            .edgesIgnoringSafeArea(.all)
            .fullScreenCover(isPresented: $showModal) {
                PopUpView()
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
        OnboardingView()
    }
}


