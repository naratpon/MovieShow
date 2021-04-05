//
//  MovieScreen.swift
//  MovieShow
//
//  Created by Naratpon Buakhaw on 2/4/2564 BE.
//

import SwiftUI

struct MovieScreen: View {
    @ObservedObject private var movieViewModel = MovieViewModel()
    @State private var movieNameSearch: String = ""
    
    var body: some View {
        VStack {
            TextField("Search", text: $movieNameSearch, onEditingChanged: { _ in }, onCommit: {
                self.movieViewModel.searchByName(self.movieNameSearch)
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
                .navigationTitle("Movies")
            
            if self.movieViewModel.loadingState == .success {
                MovieListView(movies: self.movieViewModel.movies)
            }else if self.movieViewModel.loadingState == .failed {
                FailedView()
            }else if self.movieViewModel.loadingState == .loading {
                LoadingView()
            }
            
        }.padding().embedNavigationView()
    }
}

struct MovieSreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieScreen()
    }
}
