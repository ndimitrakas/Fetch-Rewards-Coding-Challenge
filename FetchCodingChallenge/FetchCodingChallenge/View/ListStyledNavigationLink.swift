//
//  ListStyledNavigationLink.swift
//  FetchCodingChallenge
//
//  Created by Nick Dimitrakas on 7/20/24.
//

import SwiftUI

struct ListStyledNavigationLink<Destination>: View where Destination : View {
    var meal: Meal
    var destination: () -> Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Text("") // Note: for default list separator to extend
                AsyncImage(url: URL(string: meal.thumbnail)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 75, height: 75)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75, height: 75)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75, height: 75)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    @unknown default:
                        EmptyView()
                    }
                }
                Text(meal.name)
                    .fontWeight(.semibold)
                    .padding(.leading, 10)
                Spacer()
            }
            .padding(.vertical, 10)
        }
    }
}

#Preview {
    ListStyledNavigationLink(meal: Meal.placeholder) {
        EmptyView()
    }
}
