//
//  MealsHomeViewModel.swift
//  FetchCodingChallenge
//
//  Created by Nick Dimitrakas on 7/19/24.
//

import Foundation

class MealsHomeViewModel: ObservableObject {

    @Published var meals: [Meal] = []
    @Published var isLoading: Bool = false

    @MainActor
    func fetchDessertMeals() async {
        do {
            isLoading = true
            self.meals = try await MealService.shared.fetchDessertMeals()
            isLoading = false
        } catch {
            isLoading = false
            print("Failed to fetch dessert meals: \(error.localizedDescription)")
        }
    }
}
