//
//  MealsHomeViewModel.swift
//  FetchCodingChallenge
//
//  Created by Nick Dimitrakas on 7/19/24.
//

import Foundation

class MealsHomeViewModel: ObservableObject {

    @Published var meals: [Meal] = []

    @MainActor
    func fetchDessertMeals() async {
        do {
            self.meals = try await MealService.shared.fetchDessertMeals()
        } catch {
            print("Failed to fetch dessert meals: \(error.localizedDescription)")
        }
    }
}
