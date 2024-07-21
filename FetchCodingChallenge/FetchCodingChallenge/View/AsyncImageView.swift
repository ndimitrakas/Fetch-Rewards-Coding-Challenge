//
//  AsyncImageView.swift
//  FetchCodingChallenge
//
//  Created by Nick Dimitrakas on 7/20/24.
//

import SwiftUI

struct AsyncImageView: View {
    
    let imageUrl: String
    let imageSize: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: imageSize, height: imageSize)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageSize, height: imageSize)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: imageSize, height: imageSize)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    AsyncImageView(imageUrl: "", imageSize: 75)
}
