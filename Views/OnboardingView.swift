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
        
        VStack {
            ZStack {
               
//                Image("sprite_1").resizable()
//                .scaledToFit()
//                .aspectRatio(contentMode: .fill)
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .ignoresSafeArea()
                
             
                
                Button("Play") {
                    showModal = true
                }
                .padding()
                
            }
            
        
            
           
            
            
            .edgesIgnoringSafeArea(.all)
            .fullScreenCover(isPresented: $showModal) {
               PopUpView()
                    .transition(.move(edge: .top))
                    .animation(.easeOut(duration: 0.5))
            }
        
               
            
        }
    }
}
    
 
    
    struct OnboardingView_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingView()
        }
    }

