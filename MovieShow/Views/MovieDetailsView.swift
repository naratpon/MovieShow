//
//  MovieDetailsView.swift
//  MovieShow
//
//  Created by Naratpon Buakhaw on 5/4/2564 BE.
//

import SwiftUI

struct MovieDetailsView: View {
    let movieDetails: MovieDetialsViewModel
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10){
                URLImage(url: movieDetails.poster)
                    .cornerRadius(10)
                Text(movieDetails.title)
                    .font(.title)
                Text(movieDetails.plot)
                Text("Director").fontWeight(.bold)
                Text(movieDetails.director)
                HStack{
                    Rating(rating: .constant(movieDetails.rating))
                    Text("\(movieDetails.rating)/10")
                }.padding(.top, 10)
                Spacer()
            }.padding()
            .navigationBarTitle(Text(movieDetails.title), displayMode: .inline)
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let movieDetail = MovieDetail(title: "Batman Begins", year: "1992", rated: "PG-13", plot: "After training with his mentor, Batman begins his fight to free crime-ridden Gotham City from corruption.", director: "Christopher Nolan", actors: "", imdbRating: "4.8", poster: "https://m.media-amazon.com/images/M/MV5BZmUwNGU2ZmItMmRiNC00MjhlLTg5YWUtODMyNzkxODYzMmZlXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg", imdbId: "345fgD")
        return MovieDetailsView(movieDetails: MovieDetialsViewModel(movieDetail: movieDetail))
        .embedNavigationView()
    }
}
