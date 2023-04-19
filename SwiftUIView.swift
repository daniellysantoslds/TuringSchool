//
//  SwiftUIView.swift
//  TuringSchool
//
//  Created by Danielly Santos Lopes da Silva on 19/04/23.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var opacity: Double = 0.0
    @State private var showButton = false
    @State private var showModal = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // background image
                Image("background")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                
                // other views
                // ...
                
                // text view
                Text("Welcome to my app")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .opacity(opacity)
                    .animation(.easeInOut(duration: 2.0))
                    .onAppear {
                        withAnimation {
                            self.opacity = 1.0
                        }
                        
                        // wait for the animation to finish before showing the button
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                self.showButton = true
                            }
                        }
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                
                // button view
                if showButton {
                    Button(action: {
                        showModal = true
                    }) {
                        Image(systemName: "play.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2 + 100)
                    .fullScreenCover(isPresented: $showModal) {
                        OnboardingOneView()
                            .transition(.move(edge: .top))
                            .animation(.easeOut(duration: 0.5))
                    }
                }
            }
        }
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
