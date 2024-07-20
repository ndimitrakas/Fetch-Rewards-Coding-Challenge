//
//  MealDetailView.swift
//  FetchCodingChallenge
//
//  Created by Nick Dimitrakas on 7/19/24.
//

import SwiftUI

struct MealDetailView: View {
    var body: some View {
        VStack {
            Text("Meal name")
            Text("Instructions")
            Text("Ingredients with their correspending measurements")
        }
        .navigationTitle("DESSERT TITLE")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    MealDetailView()
}
