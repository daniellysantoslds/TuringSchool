//
//  OnboardingView.swift
//  TuringSchool
//
//  Created by Danielly Santos Lopes da Silva on 10/04/23.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {

            Button {
                
            } label: {
                Text("PLAY")
            }

            
            
        }  .background(Image("cenario1"))
            .scaledToFill().ignoresSafeArea()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
