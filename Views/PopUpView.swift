//
//  alertaaview.swift
//  TuringSchool
//
//  Created by Danielly Santos Lopes da Silva on 12/04/23.
//
import SwiftUI


struct PopUpView: View {
    //
    //    @State var screenWidth: CGFloat = UIScreen.main.bounds.width
    //       @State var screenHeight: CGFloat = UIScreen.main.bounds.height
    //
    
    @State private var exibirPopup = false
    @Environment(\.presentationMode) var presentationMode
    @State private var showNavigation = false
    
    @State private var flow: [ElementContentModel] = [
        ElementContentModel(image: "el1", popUpDescription: "TAL"),
        ElementContentModel(image: "el2", popUpDescription: "Outra descrição"),
        ElementContentModel(image: "el3", popUpDescription: "Mais uma descrição"),
        ElementContentModel(image: "el4", popUpDescription: "final"),
    ];
    
    // Controla nossa posicao no fluxo do jogo
    // 0 -> Estado inicial apresentacao apenas do cabecote
    // 1 -> Primeira parte da fita
    @State private var currentIndex = 0;
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                
                GeometryReader { geometryVStack in
                    
                    VStack {
                        Spacer().frame(height: 100)
                        Button(action: {
                            if (currentIndex == 0) {
                                exibirPopup.toggle()
                            }
                            
                        }) {
                            Image("popup").resizable().frame(width: 200, height: 200)
                        }.opacity(currentIndex != 0 ? 0.5 : 1.0)
                        Spacer().frame(height: 0)
                        HStack {
                            ForEach(Array(flow.enumerated()), id: \.1.id) { index, element in
                                
                               
                                let isPastElement = index < (currentIndex);
                                let isCurrentShowItem = index == currentIndex - 1;
                               
                                
                                Button(action: {
                                    if (isPastElement && isCurrentShowItem) {
                                        exibirPopup.toggle()
                                    }
                                    
                                }) {
                                    
                                    if (isPastElement) {
                                        Text(element.image).frame(width: 200, height: 200).background(Image("popup").resizable())
                                    }
                                    
                                }.opacity(isCurrentShowItem ? 1.0 : 0.5)
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
                        VStack(alignment: .center) {
                            Image("popup")
                                .resizable()
                                .frame(width: geometry.size.width * 0.8, height:geometry.size.height * 0.60)
                                .overlay(
                                    VStack {
                                        
                                        Text("Para colocar uma borda personalizada em uma VStack, você pode adicionar um overlay com um retângulo estilizado usando a propriedade stroke do Shape. Aqui está um exemplo:dicionar um overlay com um retângulo estilizado usando a propriedade stroke do Shape. Aqui está um exemplo:  ").lineLimit(7)
                                            .font(.title3)
                                            .foregroundColor(.black)
                            
                                    
                                        HStack {
                                            Button("Sair") {
                                                exibirPopup.toggle()
                                            }
                                            Spacer()
                                            Button("Próxima") {
                                                // Se currentIndex for menor que o tamanho da lista
                                                if currentIndex < flow.count - 1 {
                                                    currentIndex += 1
                                                } else {
                                                    currentIndex = 0
                                                }
                                                
                                                exibirPopup.toggle()
                                            }
                                            .fullScreenCover(isPresented:  $showNavigation) {
                                                OnboardingView()
                                            }
                                        }
                                       

                                    }.frame(width: (geometry.size.width * 0.8) * 0.88, height:(geometry.size.height * 0.60))
                                )
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                        }
                        .position(x: geometry.size.width/2, y: geometry.size.height/1.5)
                        
                    }
                }
            }
        }
        .background(Image("parede").resizable().scaledToFill())
    }
}





struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView()
    }
}


