//
//  alertaaview.swift
//  TuringSchool
//
//  Created by Danielly Santos Lopes da Silva on 12/04/23.
//
import SwiftUI


struct PopUpView: View {
    
    
    var fontR = UIFont()
    var fontB = UIFont()
    var fontM = UIFont()
    var fontR28 = UIFont()
    var fontM32 = UIFont()
    
    @State private var exibirPopup = false
    @Environment(\.presentationMode) var presentationMode
    @State private var showNavigation = false
    
    @State private var flow: [ElementContentModel] = [
        ElementContentModel(image: "beginning-of-tape", popUpDescription: "TAL"),
        ElementContentModel(image: "Prohibited", popUpDescription: "Outra descrição"),
        ElementContentModel(image: "white", popUpDescription: "Mais uma descrição"),
        ElementContentModel(image: "beginning-of-tape", popUpDescription: "final"),
    ];
    
    // Controla nossa posicao no fluxo do jogo
    // 0 -> Estado inicial apresentacao apenas do cabecote
    // 1 -> Primeira parte da fita
    @State private var flowCurrentIndex = 0;
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                
                GeometryReader { geometryVStack in
                    
                    VStack {
                        Spacer().frame(height: 100)
                        Button(action: {
                            if (flowCurrentIndex == 0) {
                                exibirPopup.toggle()
                            }
                            
                        }) {
                            Image("header").resizable().frame(width: 250, height: 250).background(Color.red)
                        }.opacity(flowCurrentIndex != 0 ? 0.5 : 1.0)
                        Spacer().frame(height: 50)
                        HStack {
                            ForEach(Array(flow.enumerated()), id: \.1.id) { index, element in
                                
                                let isPastElement = index < (flowCurrentIndex);
                                let isCurrentShowItem = index == flowCurrentIndex - 1;
                                
                                Button(action: {
                                    if (isPastElement && isCurrentShowItem) {
                                        exibirPopup.toggle()
                                    }
                                    
                                }) {
                                    
                                    if (isPastElement) {
                                        Image(flow[index].image).resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 200).background(Color.blue)
                                    }
                                    
                                }.opacity(isCurrentShowItem ? 1.0 : 0.5).background(Color.blue)
                            }
                            
                        }
                        
                        Spacer()
                    }
                    .background(
                        Image("quadro")
                            .resizable()
                            .frame(width:geometryVStack.size.width, height:  geometryVStack.size.height )
                        
                    )
                    .frame(maxWidth: geometry.size.width * 0.95, maxHeight:  geometry.size.height * 0.90).position(x: geometry.size.width/2, y: geometry.size.height/2)
                    
                }
                
                if exibirPopup {
                    
                    
                    GeometryReader { geometry in
                        
                        Image("popup")
                            .resizable()
                            .frame(width: geometry.size.width * 0.8, height:geometry.size.height * 0.8)
                            .overlay(
                                VStack {
                                    //                                        (flow[currentIndex].popUpDescription)
                                    //ScrollView {
                                    Text("none of the content here belongs to me besides the editing :) all rights go to doja and her directors/producer,none of the content here belongs to me besides the editing :) all rights go to doja and her directors/producerss oiiiiii eaiiiiiinone of the content here belongs to me besides the editing :) all rights go to doja and her directors/producer,none of the content here belongs to me besides the editing :) all rights go to doja and her directors/producerss oiiiiii eaiiiiii")
                                        .font(Font(fontR28))
                                        .lineLimit(7)
                                        .foregroundColor(.black)
                                    //}
                                    //.frame(maxHeight: geometry.size.height * 0.200)
                                    
                                    
                                    
                                    HStack(spacing: 400) {
                                        Button("Sair") {
                                            exibirPopup.toggle()
                                        } .font(Font(fontM32))
                                        Button("Próxima") {
                                            // Se currentIndex for menor que o tamanho da lista
                                            if flowCurrentIndex < flow.count - 1 {
                                                flowCurrentIndex += 1
                                            } else {
                                                flowCurrentIndex = 0
                                            }
                                            
                                            exibirPopup.toggle()
                                        } .font(Font(fontM32))
                                            .fullScreenCover(isPresented:  $showNavigation) {
                                                OnboardingView()
                                            }
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    //                                    .padding(.horizontal, 60)
                                    //                                    .padding(.top, 40)
                                    
                                    
                                    
                                    
                                }.frame(width: (geometry.size.width * 0.8) * 0.88, height:(geometry.size.height * 0.60) * 0.9)
                            )
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                            .position(x: geometry.size.width/2, y: geometry.size.height/1.5)
                        
                    }
                }
            }
        }
        .background(Image("parede").resizable().scaledToFill())
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
}





struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView()
    }
}


