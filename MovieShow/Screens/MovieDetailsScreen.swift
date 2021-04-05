//
//  MovieDetailsScreen.swift
//  MovieShow
//
//  Created by Naratpon Buakhaw on 5/4/2564 BE.
//

import SwiftUI

struct MovieDetailsScreen: View {
    let imdbId: String
    @ObservedObject var movieDetailViewModel = MovieDetialsViewModel()
    
    var body: some View {
        VStack {
            if self.movieDetailViewModel.loadingState == .success {
                MovieDetailsView(movieDetails: movieDetailViewModel)
            }else if self.movieDetailViewModel.loadingState == .failed {
                FailedView()
            }else if self.movieDetailViewModel.loadingState == .loading {
                LoadingView()
            }
        }
        .onAppear {
            self.movieDetailViewModel.getDetailsByImdbId(imdbId)
        }
    }
}
