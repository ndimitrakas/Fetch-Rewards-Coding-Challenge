//
//  MealDetailView.swift
//  FetchCodingChallenge
//
//  Created by Nick Dimitrakas on 7/19/24.
//

import SwiftUI

struct MealDetailView: View {
    
    @StateObject var mealDetailViewModel = MealDetailViewModel()
    
    let mealID: String
    
    var body: some View {
        VStack {
            if let detail = mealDetailViewModel.mealDetail {
                Text(detail.name)
                Text(detail.instructions)
                //TODO: add forEach loop for ingredients and measurements (make this look pretty)
                //ForEach()
            } else {
                Text("Loading...")
            }
        }
        .navigationTitle(mealDetailViewModel.mealDetail?.name ?? "")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            Task {
                await mealDetailViewModel.fetchMealDetail(id: mealID)
            }
        }
    }
}

#Preview {
    MealDetailView(mealID: "53049") // Apam balik
}
