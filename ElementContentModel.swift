//
//  ElementContentModel.swift
//  TuringSchool
//
//  Created by Danielly Santos Lopes da Silva on 12/04/23.
//

import Foundation


class ElementContentModel {
    let id: UUID;
    let image: String;
    let popUpDescription: String;
    
    init(image: String, popUpDescription: String) {
        self.id = UUID()
        self.image = image
        self.popUpDescription = popUpDescription
    }
}
