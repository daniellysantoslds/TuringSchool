//
//  SwiftUIView.swift
//  
//
//  Created by Danielly Santos Lopes da Silva on 17/04/23.
//

import SwiftUI

struct IntroductionView: View {
    
    var fontR = UIFont()
    var fontB = UIFont()
    var fontM = UIFont()
    var fontR28 = UIFont()
    var fontM32 = UIFont()
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                GeometryReader { geometryVStack in
                    
                    VStack {
                        Text("Hello, World!")
                        
                       
                        
                    }.background(
                        Image("quadro")
                            .resizable()
                            .frame(width:geometryVStack.size.width, height:  geometryVStack.size.height )
                        
                    )
                    .frame(maxWidth: geometry.size.width * 0.95, maxHeight:  geometry.size.height * 0.90).position(x: geometry.size.width/2, y: geometry.size.height/2)
                    
                    Image("turin").frame(width: 200, height: 200)
            .alignmentGuide(.top) { d in d[.top] }
            .alignmentGuide(.leading) { d in d[.leading] }
            .offset(x: geometry.size.width / 20,  y: geometry.size.height - 284)
                    
                }
            }
            
     
        } .background(Image("wall").resizable().scaledToFill())
        
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
        
        
        
    }
    
    
    
    
    
    struct IntroductionView_Previews: PreviewProvider {
        static var previews: some View {
            IntroductionView()
        }
    }
    
}
