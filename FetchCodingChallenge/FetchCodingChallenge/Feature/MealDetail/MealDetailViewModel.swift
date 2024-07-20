//
//  MealDetailViewModel.swift
//  FetchCodingChallenge
//
//  Created by Nick Dimitrakas on 7/19/24.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    @Published var mealDetail: MealDetail?

    @MainActor
    func fetchMealDetail(id: String) async {
        do {
            self.mealDetail = try await MealService.shared.fetchMealDetails(id: id)
        } catch {
            print("Failed to fetch meal details: \(error.localizedDescription)")
        }
    }
}
