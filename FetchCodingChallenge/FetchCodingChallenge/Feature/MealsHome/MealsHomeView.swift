//
//  MealsHomeView.swift
//  FetchCodingChallenge
//
//  Created by Nick Dimitrakas on 7/19/24.
//

import SwiftUI

struct MealsHomeView: View {
    
    @StateObject var mealsHomeViewModel = MealsHomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(mealsHomeViewModel.meals) { meal in
                    ListStyledNavigationLink(meal: meal) {
                        MealDetailView(mealID: meal.id, imageUrl: meal.thumbnail)
                    }
                }
            }
            .overlay {
                ProgressView()
                    .opacity(mealsHomeViewModel.isLoading ? 1 : 0)
            }
            .onAppear {
                    Task {
                        await mealsHomeViewModel.fetchDessertMeals()
                    }
                }
            .navigationTitle("Desserts")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    MealsHomeView()
}
