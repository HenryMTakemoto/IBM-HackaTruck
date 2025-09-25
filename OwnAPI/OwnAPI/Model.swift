//
//  Model.swift
//  OwnAPI
//
//  Created by Turma02-10 on 19/09/25.
//

import SwiftUI

struct Estadio: Decodable, Hashable{

    var nomeEstadio: String
    var donoDoEstadio: String
    var capacidade: String
    var foto: String
    var latitude: Double
    var longitude: Double
    
}
