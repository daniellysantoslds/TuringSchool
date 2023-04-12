//
//  alertaaview.swift
//  TuringSchool
//
//  Created by Danielly Santos Lopes da Silva on 12/04/23.
//

import SwiftUI



//class PopUpState: ObservableObject {
//    @Published var exibirPopup = false
//    static let shared = PopUpState()
//}
//
//class ShowNavigation: ObservableObject {
//    @Published var exibirNavigation = false
//    static let shared = ShowNavigation()
//}

struct PopUpView: View {
    @State private var exibirPopup = false
    @Environment(\.presentationMode) var presentationMode
    @State private var showNavigation = false
    
    
    
    var body: some View {
        ZStack {
            VStack {
                Button("Exibir Popup") {
                    exibirPopup.toggle()
                }
                .padding(.bottom, 800)
            }
            
            if exibirPopup {
                
                Color.pink
                    .frame(width: 700, height: 345)
                    .cornerRadius(10)
                    .overlay(
                        VStack {
                            Text("Este é um exemplo de jdjjdjdjjdjdjjdjdjdjjjdjd popupaaaaaaaanajdjdjjsjjdjajajjajjsjsjsjsjsjjjjdjjdjjdjdjjdjjdjjdjdjjdjdjjdjdjjdjdjjdjjdjdjdjjdjd.").lineLimit(7)
                                .foregroundColor(.black)
                            HStack {
                                Button("Sair") {
                                    exibirPopup.toggle()
                                }
                                Button("Próxima") {
                                    
                                    showNavigation = true
                                    
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

