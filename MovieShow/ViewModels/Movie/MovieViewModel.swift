//
//  MovieViewModel.swift
//  MovieShow
//
//  Created by Naratpon Buakhaw on 2/4/2564 BE.
//

import Foundation

class MovieViewModel: ViewModelBase {
    @Published var movies = [MovieListViewModel]()
    let movieService = MovieService()
    
    func searchByName(_ name: String) {
        if name.isEmpty {
            return
        }
        self.loadingState = .loading
        movieService.getMovieBy(search: name.trimmedAndEscaped()) { result in
            switch result {
            case .success(let result):
                if let result = result {
                    DispatchQueue.main.async {
                        self.movies = result.map(MovieListViewModel.init)
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
    
}

struct MovieListViewModel {
    let movie: Movie
    
    var title: String {
        movie.title ?? ""
    }
    
    var imdbId: String {
        movie.imdbId ?? ""
    }
    
    var poster: String {
        movie.poster ?? ""
    }
    
    var year: String {
        movie.year ?? ""
    }
}
