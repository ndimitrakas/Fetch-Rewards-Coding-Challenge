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
    let imageUrl: String
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20) {
                    if let detail = mealDetailViewModel.mealDetail {
                        AsyncImageView(imageUrl: imageUrl, imageSize: 250)
                        
                        // Ingredients and Measurements Card View
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Ingredients & Measurements")
                                .font(.headline)
                            
                            ForEach(Array(zip(detail.ingredients, detail.measurements)), id: \.0) { ingredient, measurement in
                                if !ingredient.isEmpty && !measurement.isEmpty {
                                    HStack {
                                        Text("• \(measurement) \(ingredient)")
                                        Spacer()
                                    }
                                    .padding(.leading, 5)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(15)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("CardColor"))
                        )
                        
                        // Instructions Card View
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Instructions")
                                .font(.headline)
                            Text(detail.instructions)
                            
                        }
                        .padding(15)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("CardColor"))
                        )
                    }
                    Spacer()
                }
                .padding(.horizontal, 30)
                .overlay {
                    ProgressView()
                        .opacity(mealDetailViewModel.isLoading ? 1 : 0)
                }
            }
            .navigationTitle(mealDetailViewModel.mealDetail?.name ?? "")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                Task {
                    await mealDetailViewModel.fetchMealDetail(id: mealID)
                }
            }
        }
    }
}

#Preview {
    MealDetailView(mealID: "", imageUrl: "")
}
