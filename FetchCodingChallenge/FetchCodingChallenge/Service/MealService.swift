//
//  MealService.swift
//  FetchCodingChallenge
//
//  Created by Nick Dimitrakas on 7/19/24.
//

import Foundation

class MealService {
    static var shared = MealService()
    
    func fetchDessertMeals() async throws -> [Meal] {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode([String: [Meal]].self, from: data)
        return response["meals"] ?? []
    }

    func fetchMealDetails(id: String) async throws -> MealDetail {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode([String: [MealDetail]].self, from: data)
        guard let mealDetail = response["meals"]?.first else {
            throw URLError(.cannotParseResponse)
        }
        return mealDetail
    }
}
