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
    var fontMoBo = UIFont()
    
    @State private var exibirPopup = false
    @Environment(\.presentationMode) var presentationMode
    @State private var showNavigation = false
    
    @State private var flow: [ElementContentModel] = [
        ElementContentModel(image: "beginning-of-tape", popUpDescription: "In the first item, we have the control unit, which is also called the tape reading head. It is important to note that the tape is infinite. This unit is responsible for reading and writing symbols on the tape, as well as moving left or right. We can imagine that the read head works as if it were a person looking at each square on the tape, moving their attention left or right."),
        ElementContentModel(image: "Prohibited", popUpDescription: "Now we are on the second item, represented by the lowercase delta symbol (δ), this element indicates the initial state of the machine, which means that everything will start from that point. When the machine is activated, this is where the reading head is positioned. From then on, the machine starts executing the instructions present in its transition table to process the data stored on the tape."),
        ElementContentModel(image: "white", popUpDescription: "In the third item, it is important to highlight that every program has a data input, which can be a sequence of characters, such as letters, numbers, codes or programs, which will be processed and calculated. This entry will be written to the tape itself by the user who wants to perform the computation. These input items are processed by the read head along the tape, and how the machine processes them depends on the rules contained in the transition table."),
        ElementContentModel(image: "white", popUpDescription: "The fourth item and the last one we will cover is the white symbol, represented by the beta symbol. This symbol is used to indicate an empty space on the tape where no information is stored. It is used to signal that there is no more input information to be read and therefore the computation must be terminated."),
        
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
                            Image("header").resizable().frame(width: 200, height: 200)
                            //.scaleEffect(1.2)
                                .animation(
                                    Animation.spring(response: 0.8, dampingFraction: 0.8) // duração de 1,5 segundos
                                    // repete para sempre
                                )
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
                                        Image(flow[index].image).resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 200)
                                    }
                                    
                                }.opacity(isCurrentShowItem ? 1.0 : 0.5)
                            }
                            
                        }
                        
                        Spacer()
                    }
                    .background(
                        Image("frame")
                            .resizable()
                            .frame(width:geometryVStack.size.width, height:  geometryVStack.size.height )
                        
                    )
                    .frame(maxWidth: geometry.size.width * 0.95, maxHeight:  geometry.size.height * 0.90).position(x: geometry.size.width/2, y: geometry.size.height/2)
                    
                }
                
                if exibirPopup {
                    GeometryReader { geometry in
                        Color.white
                            .frame(width: geometry.size.width * 0.8, height:geometry.size.height * 0.38)
                            .overlay(
                                VStack {
                                    Text(flow[flowCurrentIndex].popUpDescription)
                                        .font(Font(fontMoBo))
                                        .padding()
                                        .foregroundColor(.black)
                                    
                                    
                                    
                                    HStack(spacing: 600) {
                                        Button("esc") {
                                            exibirPopup.toggle()
                                        } .font(Font(fontM32)).foregroundColor(Color("marron"))
                                        Button("next") {
                                            
                                            if flowCurrentIndex < flow.count - 1 {
                                                flowCurrentIndex += 1
                                            } else {
                                                exibirPopup.toggle()
                                                showNavigation.toggle()
                                            }
                                            
                                            exibirPopup.toggle()
                                        } .font(Font(fontM32)).foregroundColor(Color("marron")).padding()
                                            .fullScreenCover(isPresented:  $showNavigation) {
                                                EndView()
                                            }
                                    }
                                    
                                    
                                    
                                    
                                }.padding(.vertical, 10)
                                
                                //.frame(width: (geometry.size.width * 0.8) * 0.88, height:(geometry.size.height * 0.60) * 0.9)
                            )
                        //.frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                            .position(x: geometry.size.width/2, y: geometry.size.height/1.5)
                        
                    }
                }
            }
        }
        .background(Image("wall").resizable().scaledToFill())
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
        fontM32 = UIFont(name: "PixelOperatorMonoHB8", size: 18)!
        fontMoBo = UIFont(name: "PixelOperatorMonoHB8", size: 20)!
        
        
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView()
    }
}


