//
//  SwiftUIView.swift
//  
//
//  Created by Danielly Santos Lopes da Silva on 18/04/23.
//

import SwiftUI

struct OnboardingTwoView: View {
    
  
    var fontM32 = UIFont()
    var fontMoBo = UIFont()
    
    let textToType = "In today's class, I'd like to introduce you to one of my most important inventions: the Turing Machine - yes, it bears my last name! This is a theoretical device also known as a universal machine."
    
    @State private var typedText = ""
    
    @State var showButton = false
    
    @State private var showNavigation = false
    
    
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
                                showNavigation.toggle()
                                
                            }) {
                                Text("next")
                                    .foregroundColor(Color("Yellow-0")).font(Font( fontM32))
                            }
                            .offset(y: geometry.size.width / 100 )
                            .fullScreenCover(isPresented: $showNavigation, content: {
                                OnboardingThreeView().animation(nil)
                            })
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
                        Image("frame")
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
       
        
        let cfURL4 = Bundle.main.url(forResource: "PixelOperatorMonoHB8", withExtension: "ttf")! as CFURL
        CTFontManagerRegisterFontsForURL(cfURL4, CTFontManagerScope.process, nil)
        
     
        fontM32 = UIFont(name: "PixelOperatorMonoHB8", size: 24)!
        fontMoBo = UIFont(name: "PixelOperatorMonoHB8", size: 30)!
        
        
    }
    
    
    
    struct OnboardingTwoView_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingTwoView()
        }
    }
}
