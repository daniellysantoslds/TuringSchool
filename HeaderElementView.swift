//
//  SwiftUIView.swift
//  TuringSchool
//
//  Created by Danielly Santos Lopes da Silva on 10/04/23.
//

import SwiftUI

struct HeaderElemenentView: View {
    @State private var isShowingModal = false
    
    var body: some View {

    Button("Show modal") {
             isShowingModal = true
         }
         .sheet(isPresented: $isShowingModal) {
             ModalView()
         }
     }
 }

 struct ModalView: View {
     
     @State private var showNavigation = false

     
     @Environment(\.presentationMode) var presentationMode
     
     var body: some View {
         VStack {
             Text("This is a modal view!")
             
             Button("proxima") {
                 showNavigation = true
             }
             .fullScreenCover(isPresented:  $showNavigation) {
                 FitaView()
             }
             
             Button("Dismiss") {
                 presentationMode.wrappedValue.dismiss()
             }
         }
         //.padding()
         //.background(Color.white)
         //.cornerRadius(10)
         .background((Color.red))
     }
 }
 







struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderElemenentView()
    }
}
