//
//  MovieListView.swift
//  MovieShow
//
//  Created by Naratpon Buakhaw on 2/4/2564 BE.
//

import SwiftUI

struct MovieListView: View {
    let movies: [MovieListViewModel]

    var body: some View {
        List(self.movies, id: \.imdbId) { movie in
            NavigationLink(destination: MovieDetailsScreen(imdbId: movie.imdbId)) {
                MovieCell(movie: movie)
            }
        }
    }
}

struct MovieCell: View {
    let movie: MovieListViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            URLImage(url: movie.poster)
                .frame(width: 100, height: 120)
                .cornerRadius(6)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top, 10)
            }.padding(5)
            Spacer()
        }.contentShape(Rectangle())
    }
}
