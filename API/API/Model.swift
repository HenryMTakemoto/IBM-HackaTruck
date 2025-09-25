//
//  Model.swift
//  API
//
//  Created by Turma02-10 on 17/09/25.
//

import SwiftUI

struct Frutas: Decodable, Hashable{

    var name: String?
    var nutritions: Nutritions
}

struct Nutritions: Codable, Hashable{
    var calories: Int
    var fat: Float
    var sugar: Float
    var protein: Float
    var carbohydrates: Float
}
