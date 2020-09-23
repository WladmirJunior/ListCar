//
//  Car.swift
//  Carros
//
//  Created by Wladmir  on 23/09/20.
//

import Foundation

struct Car: Codable {
    public let name, date: String
    public let value: Int
    public let brand, color, createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case name = "nome"
        case date = "data"
        case value = "Valor"
        case brand = "Marca"
        case color = "Cor"
        case createdAt
    }
}
