//
//  SwiftUIView.swift
//  
//
//  Created by Danielly Santos Lopes da Silva on 18/04/23.
//

import SwiftUI

struct EndView: View {
    
    @State private var showModal = false
 
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                
                
                
                Button(action: {
                    showModal = true
                }) {
                    Image("restart-button")
                }
                .frame(width: 100, height: 100)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                
                
                Button(action: {
                    showModal = true
                }) {
                    Image("credits-button")
                }
                .frame(width: 100, height: 100)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 6)
                
                
            }
            
        }
        
       
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView()
    }
}
