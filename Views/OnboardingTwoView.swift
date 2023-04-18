//
//  SwiftUIView.swift
//  
//
//  Created by Danielly Santos Lopes da Silva on 18/04/23.
//

import SwiftUI

struct OnboardingTwoView: View {
    
    var fontR = UIFont()
    var fontB = UIFont()
    var fontM = UIFont()
    var fontR28 = UIFont()
    var fontM32 = UIFont()
    var fontMoBo = UIFont()
    
    let textToType = "In today's class, I'd like to introduce you to one of my most important inventions: the Turing Machine - yes, it bears my last name! This is a theoretical device also known as a universal machine."
    
    @State private var typedText = ""
    
    @State var showButton = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                GeometryReader { geometryVStack in
                    VStack {
                        Text(typedText).font(Font(fontMoBo))
                            .lineSpacing(5)
                            .frame(width: 800, height: 430, alignment: .leading)
                            .foregroundColor(Color.white)
                            .animation(Animation.linear(duration: 0.04).repeatCount(1, autoreverses: false).delay(0.5))
                        
                        if showButton {
                            Button(action: {
                            }, label: {
                                Text("next")
                                    .foregroundColor(.red)
                            }).offset(y: geometry.size.width / 100 )
                        }
                        
                    }.onAppear {
                        for index in textToType.indices {
                            DispatchQueue.main.asyncAfter(deadline: .now() + Double(textToType.distance(from: textToType.startIndex, to: index)) * 0.05) {
                                typedText.append(textToType[index])
                                if index == textToType.index(before: textToType.endIndex) {
                                    showButton = true
                                }
                            }
                        }
                    }
                    .background(
                        Image("quadro")
                            .resizable()
                            .frame(width:geometryVStack.size.width, height:  geometryVStack.size.height )
                    )
                    .frame(maxWidth: geometry.size.width * 0.95, maxHeight:  geometry.size.height * 0.90).position(x: geometry.size.width/2, y: geometry.size.height/2)
                    
                    Image("turin").resizable()
                        .frame(width: 180, height: 180)
                        .alignmentGuide(.top) { d in d[.top] }
                        .alignmentGuide(.leading) { d in d[.leading] }
                        .offset(x: geometry.size.width / 35,  y: geometry.size.height - 195)
                    
                }
            }
        }.background(Image("wall").resizable().scaledToFill())
        
        
    }
    
    init() {
        let cfURL = Bundle.main.url(forResource: "PixelOperator-Bold", withExtension: "ttf")! as CFURL
        
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        let cfURL2 = Bundle.main.url(forResource: "PixelOperator", withExtension: "ttf")! as CFURL
        
        CTFontManagerRegisterFontsForURL(cfURL2, CTFontManagerScope.process, nil)
        
        let cfURL3 = Bundle.main.url(forResource: "PixelOperatorMono8", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL3, CTFontManagerScope.process, nil)
        
        
        let cfURL4 = Bundle.main.url(forResource: "PixelOperatorMonoHB8", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL4, CTFontManagerScope.process, nil)
        
        fontR = UIFont(name: "PixelOperator-Bold", size:  180)!
        fontB = UIFont(name: "PixelOperator", size:  80)!
        fontM = UIFont(name: "PixelOperatorMono8", size: 80)!
        fontM = UIFont(name: "PixelOperatorMono8", size: 80)!
        fontR28 = UIFont(name: "PixelOperator", size: 28)!
        fontM32 = UIFont(name: "PixelOperatorMono8", size: 18)!
        fontMoBo = UIFont(name: "PixelOperatorMonoHB8", size: 30)!
        
        
    }
    
    
    
    struct OnboardingTwoView_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingTwoView()
        }
    }
}