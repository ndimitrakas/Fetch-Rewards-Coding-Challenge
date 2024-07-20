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
    let imageURL: String
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20) {
                    if let detail = mealDetailViewModel.mealDetail {
                        AsyncImage(url: URL(string: imageURL)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 75, height: 75)
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 300)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            case .failure:
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 75, height: 75)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            @unknown default:
                                EmptyView()
                            }
                        }
                        // Instructions Card View
                        VStack(spacing: 15) {
                            HStack {
                                Text("Instructions")
                                    .font(.headline)
                                Spacer()
                            }
                            Text(detail.instructions)
                            
                        }
                        .padding(15)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("CardColor"))
                        )
                        
                        // Ingredients and Measurements Card View
                        VStack(alignment: .center, spacing: 15) {
                            Text("Ingredients & Measurements")
                                .font(.headline)
                            
                            VStack(spacing: 5) {
                                ForEach(Array(zip(detail.ingredients, detail.measurements)), id: \.0) { ingredient, measurement in
                                    if !ingredient.isEmpty && !measurement.isEmpty {
                                        Text("\(measurement) \(ingredient)")
                                    }
                                }
                            }
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
    MealDetailView(mealID: "", imageURL: "")
}
