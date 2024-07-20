//
//  Meal.swift
//  FetchCodingChallenge
//
//  Created by Nick Dimitrakas on 7/19/24.
//

import Foundation


struct Meal: Identifiable, Codable {
    let name: String
    let thumbnail: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case thumbnail = "strMealThumb"
        case id = "idMeal"
    }
    
    static var placeholder: Meal = Meal(name: "", thumbnail: "", id: "")
}
