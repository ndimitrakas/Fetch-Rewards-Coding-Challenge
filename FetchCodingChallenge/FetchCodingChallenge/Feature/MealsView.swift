//
//  MealsView.swift
//  FetchCodingChallenge
//
//  Created by Nick Dimitrakas on 7/19/24.
//

import SwiftUI

struct MealsView: View {
    var body: some View {
        NavigationView {
            NavigationLink(
            destination: DessertDetailView(),
            label: {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("To detail view!")
                }
                .padding()
            })
        }
    }
}

#Preview {
    MealsView()
}
