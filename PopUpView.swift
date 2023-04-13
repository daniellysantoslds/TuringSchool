//
//  alertaaview.swift
//  TuringSchool
//
//  Created by Danielly Santos Lopes da Silva on 12/04/23.
//

import SwiftUI


struct PopUpView: View {
    @State private var exibirPopup = false
    @Environment(\.presentationMode) var presentationMode
    @State private var showNavigation = false
    
    @State private var flow: [ElementContentModel] = [
        ElementContentModel(image: "Elemento 1", popUpDescription: "TAL"),
        ElementContentModel(image: "Elemento 2", popUpDescription: "Outra descrição"),
        ElementContentModel(image: "Elemento 3", popUpDescription: "Mais uma descrição"),
    ]
    
    
    @State private var currentIndex = 0
    
    var body: some View {
        ZStack {
            VStack {
                
                Button(flow[currentIndex].image) {
                    exibirPopup.toggle()
                    
                }
               
                
                HStack {
                    ForEach(Array(flow.enumerated()), id: \.1.id) { index, element in
                           Button(action: {
                             
                           }) {
                               
                               var isCurrentIndex = index == currentIndex;
                               var isPastElement = index < ((currentIndex + 1) - 1);
                               var isCurrentIndexDifferentZero = currentIndex != 0;
                               
                               
                              
                               if ((isCurrentIndex || isPastElement) && isCurrentIndexDifferentZero) {
                                   Text(element.image)
                               }
                               
                           }
                       }
                }
            }
            
            if exibirPopup {
                Color.pink
                    .frame(width: 700, height: 345)
                    .cornerRadius(10)
                    .overlay(
                        VStack {
                            Text(flow[currentIndex].popUpDescription).lineLimit(7)
                                .foregroundColor(.black)
                            HStack {
                                Button("Sair") {
                                    exibirPopup.toggle()
                                }
                                Button("Próxima") {
                                    if currentIndex < flow.count - 1 {
                                        currentIndex += 1
                                    } else {
                                        currentIndex = 0
                                    }
                                    
                                    exibirPopup.toggle()
                                }
                                .fullScreenCover(isPresented:  $showNavigation) {
                                    FitaView()
                                }
                            }
                        }
                    )
                    .offset(x: 0, y:400)
            }
        }
    }
}






struct alertaaview_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView()
    }
}

