//
//  SwiftUIView.swift
//  TuringSchool
//
//  Created by Danielly Santos Lopes da Silva on 17/04/23.
//

import SwiftUI

struct AnimationText: View {
    let textToType = "Hey guys! My name is Alan Turing and I will be your new math teacher. In addition to being a mathematician, I am a computer scientist, cryptanalyst, philosopher and biologist, born in London.Hey guys! My name is Alan Turing and I will be your new math teacher. In addition to being a mathematician, I am a computer scientist, cryptanalyst, philosopher and biologist, born in London"

        @State private var typedText = ""

        var body: some View {
            VStack {
                Text(typedText)
                    .font(.title)
                    .padding(.all, 10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    .animation(Animation.linear(duration: 0.04).repeatCount(1, autoreverses: false).delay(0.5)) // Adiciona a animação de digitação

                Spacer()
            }
            .onAppear {
                for index in textToType.indices {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(textToType.distance(from: textToType.startIndex, to: index)) * 0.05) {
                        typedText.append(textToType[index])
                    }
                }
            }
        }
    }

struct AnimationText_Previews: PreviewProvider {
    static var previews: some View {
        AnimationText()
    }
}
