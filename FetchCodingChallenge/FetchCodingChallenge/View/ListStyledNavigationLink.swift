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
                AsyncImageView(imageUrl: meal.thumbnail, imageSize: 75)
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
