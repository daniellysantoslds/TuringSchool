//
//  OnboardingView.swift
//  TuringSchool
//
//  Created by Danielly Santos Lopes da Silva on 10/04/23.
//

import SwiftUI
//import PlaygroundSupport




struct OnboardingView: View {
    
    @State private var showModal = false
    var body: some View {
        
        ZStack {
            
            Button("Play") {
                showModal = true
            }
        
            Image("floor")
                .resizable()
                .ignoresSafeArea()
                
          
                Button("Play") {
                    showModal = true
                }
            
            .edgesIgnoringSafeArea(.all)
            .fullScreenCover(isPresented: $showModal) {
                PopUpView()
                    .transition(.move(edge: .top))
                    .animation(.easeOut(duration: 0.5))
            }
            
        }
        .background(Image("sky").resizable().scaledToFill())
        .edgesIgnoringSafeArea(.all)


    }
        
    
    
    
    struct OnboardingView_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingView()
        }
    }
    
}
