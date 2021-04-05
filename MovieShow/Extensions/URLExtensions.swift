//
//  URLExtensions.swift
//  MovieShow
//
//  Created by Naratpon Buakhaw on 2/4/2564 BE.
//

import Foundation

extension URL {
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?s=\(name)&apikey=\(Constant.API_KEY)")
    }
    
    static func forMoviesDetailByImdbId(_ imdbId: String) -> URL? {
        return URL(string: "http://www.omdbapi.com/?i=\(imdbId)&apikey=\(Constant.API_KEY)")
    }
}
