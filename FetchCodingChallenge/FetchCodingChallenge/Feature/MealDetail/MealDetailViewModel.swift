//
//  MealDetailViewModel.swift
//  FetchCodingChallenge
//
//  Created by Nick Dimitrakas on 7/19/24.
//

import Foundation

class MealDetailViewModel: ObservableObject {
    @Published var mealDetail: MealDetail?
    @Published var isLoading: Bool = false

    @MainActor
    func fetchMealDetail(id: String) async {
        do {
            isLoading = true
            self.mealDetail = try await MealService.shared.fetchMealDetails(id: id)
            isLoading = false
        } catch {
            isLoading = false
            print("Failed to fetch meal details: \(error.localizedDescription)")
        }
    }
}
