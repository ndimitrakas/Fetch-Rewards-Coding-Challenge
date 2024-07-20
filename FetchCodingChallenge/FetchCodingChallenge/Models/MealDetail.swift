//
//  MealDetail.swift
//  FetchCodingChallenge
//
//  Created by Nick Dimitrakas on 7/19/24.
//

import Foundation

struct MealDetail: Codable {
    let id: String
    let name: String
    let instructions: String
    var ingredients: [String]
    var measurements: [String]

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case instructions = "strInstructions"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        instructions = try container.decode(String.self, forKey: .instructions)
        
        var ingredients: [String] = []
        var measurements: [String] = []

        let allKeys = try decoder.container(keyedBy: DynamicCodingKeys.self)

        for index in 1...20 {
            let ingredientKey = DynamicCodingKeys(stringValue: "strIngredient\(index)")!
            let measurementKey = DynamicCodingKeys(stringValue: "strMeasure\(index)")!
            // FIXME: strip the string to make sure the string is actually empty (some of the values have a space " ") just use .strip to remove leading and trailing spaces
            if let ingredient = try allKeys.decodeIfPresent(String.self, forKey: ingredientKey), !ingredient.isEmpty {
                ingredients.append(ingredient)
            }
            // FIXME: strip the string to make sure the string is actually empty (some of the values have a space " ") just use .strip to remove leading and trailing spaces
            if let measurement = try allKeys.decodeIfPresent(String.self, forKey: measurementKey), !measurement.isEmpty {
                measurements.append(measurement)
            }
        }
        
        self.ingredients = ingredients
        self.measurements = measurements
    }

    struct DynamicCodingKeys: CodingKey {
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        var intValue: Int?
        init?(intValue: Int) {
            return nil
        }
    }
}

