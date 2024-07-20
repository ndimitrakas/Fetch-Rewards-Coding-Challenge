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
                    NavigationLink(destination: MealDetailView(mealID: meal.id), label: {
                        HStack {
                            // FIXME: replace the globe with the image of the meal
                            Image(systemName: "globe")
                                .imageScale(.large)
                                .foregroundStyle(.tint)
                            Text(meal.name)
                            Spacer()
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                    })
                }
            }
            .onAppear {
                    Task {
                        await mealsHomeViewModel.fetchDessertMeals()
                    }
                }
            .navigationTitle("Meals")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    MealsHomeView()
}
