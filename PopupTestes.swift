//
//  PopupTestes.swift
//  TuringSchool
//
//  Created by Danielly Santos Lopes da Silva on 18/04/23.
//

import SwiftUI

struct PopupTestes: View {

@State var showPopup = false

    var body: some View {
        VStack {
            Button("Mostrar pop-up") {
                showPopup = true
            }
        }
        .overlay(
            Group {
                if showPopup {
                    CustomPopUpView()
                        .frame(width: 700, height: 700)
                        .transition(.scale)
                }
            }
        )
    }
}


struct CustomPopUpView: View {
    var body: some View {
        ZStack {
                Color.white
            VStack {
                Text("Este é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-upEste é um pop-up")
                    .font(.title)
                    .padding()
            HStack {
                Text("oiii")
                Text("oiii")
            }

            }

        }
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}


struct PopupTestes_Previews: PreviewProvider {
    static var previews: some View {
        PopupTestes()
    }
}
