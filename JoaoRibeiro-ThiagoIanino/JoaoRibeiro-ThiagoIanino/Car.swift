//
//  Car.swift
//  JoaoRibeiro-ThiagoIanino
//
//  Created by andre on 09/10/20.
//  Copyright © 2020 joao. All rights reserved.
//

import Foundation

struct Car{
    public let name, date: String
    public let value: Int
    public let brand, color, createdAt: String
    public let image: String
    
    enum CodingKeys: String{
        case name = "nome"
        case date = "data"
        case value = "valor"
        case brand = "marca"
        case color = "cor"
        case image
        case createdAt
    }
}
