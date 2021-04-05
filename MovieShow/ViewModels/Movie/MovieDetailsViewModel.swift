//
//  MovieDetailsViewModel.swift
//  MovieShow
//
//  Created by Naratpon Buakhaw on 5/4/2564 BE.
//

import Foundation

class MovieDetialsViewModel: ViewModelBase {
    @Published var movieDetail: MovieDetail?
    let movieDetailsService = MovieService()
    
    init(movieDetail: MovieDetail? = nil) {
        if let movieDetail = movieDetail {
            self.movieDetail = movieDetail
        }
    }
    
    func getDetailsByImdbId(_ imdbId: String) {
        self.loadingState = .loading
        movieDetailsService.getMovieDetailBy(imdbId: imdbId) { result in
            switch result {
            case .success(let result):
                if let result = result {
                    DispatchQueue.main.async{
                        self.movieDetail = result
                        self.loadingState = .success
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
            
        }
    }
    
    var title: String {
        self.movieDetail?.title ?? ""
    }
    
    var poster: String {
        self.movieDetail?.poster ?? ""
    }
    
    var plot: String {
        self.movieDetail?.plot ?? ""
    }
    
    var rating: Int {
        get {
            let ratingAsDouble = Double(self.movieDetail?.imdbRating ?? "0.0")
            return Int(ceil(ratingAsDouble ?? 0.0))
        }
    }
    
    var director: String {
        self.movieDetail?.director ?? ""
    }
}


