//
//  Movies.swift
//  MVVM_SwiftUI_Combine_TMDB
//
//  Created by Carlos on 2/2/22.
//

import Foundation


// MARK: - Movies
struct  Movies: Codable {
    
    let listOfMovies : [Movie]
    
    enum CodingKeys: String, CodingKey {
        case listOfMovies = "results"
    }
    
}


// MARK: - Movie
struct Movie: Codable {

    let image: String
    let movieID: Int
    let originalTitle: String
    let popularity: Double
    let releaseDate: String
    let sinopsis: String
    let title: String
    let voteCount: Int
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case image = "poster_path"
        case movieID = "id"
        case originalTitle = "original_title"
        case popularity
        case releaseDate = "release_date"
        case sinopsis = "overview"
        case title
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
    }

}
