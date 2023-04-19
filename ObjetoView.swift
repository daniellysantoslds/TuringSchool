//
//  SwiftUIView.swift
//  TuringSchool
//
//  Created by Danielly Santos Lopes da Silva on 18/04/23.
//

import SwiftUI


struct ObjetoView: View {
    @State private var rectanglePosition = CGPoint(x: 0, y: 0)

    var body: some View {
        Image("sky")
            .frame(width: 50, height: 50)
            .foregroundColor(.blue)
            .offset(x: rectanglePosition.x, y: rectanglePosition.y)
            .animation(.linear(duration: 2))
            .onAppear {
                self.rectanglePosition = CGPoint(x: UIScreen.main.bounds.width - 75, y: 0)
            }
    }
}
struct ObjetoView_Previews: PreviewProvider {
    static var previews: some View {
        ObjetoView()
    }
}
