//
//  MealsHomeView.swift
//  FetchCodingChallenge
//
//  Created by Nick Dimitrakas on 7/19/24.
//

import SwiftUI

struct MealsHomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink(
                    destination: MealDetailView(),
                    label: {
                        HStack {
                            Image(systemName: "globe")
                                .imageScale(.large)
                                .foregroundStyle(.tint)
                            Text("To detail view!")
                            Spacer()
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                    })
                    NavigationLink(
                    destination: MealDetailView(),
                    label: {
                        HStack {
                            Image(systemName: "globe")
                                .imageScale(.large)
                                .foregroundStyle(.tint)
                            Text("To detail view!")
                            Spacer()
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                    })
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
