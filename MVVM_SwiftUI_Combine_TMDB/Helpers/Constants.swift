//
//  Constants.swift
//  MVVM_SwiftUI_Combine_TMDB
//
//  Created by Carlos on 2/2/22.
//

import Foundation

struct Constants {
    
    struct App {
        static let name = "The movies App"
    }
    
    struct API {
        static let apiKeyBridge = "?api_key="
        static let apiKeyValue = "d535b316cd84b2899e503444201247c1"
        
        struct URL {
            static let urlMainSite = "https://api.themoviedb.org/"
            static let urlMainImagesW200 = "https://image.tmdb.org/t/p/w200"
        }
        
        struct Endpoints {
            static let urlEndpointListMovies = "3/movie/popular"
            static let urlEndpointDetailMovie = "3/movie/"
        }
        
        struct Params {
            static let paramPage = "&page="
        }
    }
    
    struct Strings {
        static let placeholderImage = "xmark.octagon.fill"
        static let previewImage = "/1BIoJGKbXjdFDAqUEiA2VHqkK1Z.jpg"
        static let previewImageFullUrl = Constants.API.URL.urlMainImagesW200 + "/1BIoJGKbXjdFDAqUEiA2VHqkK1Z.jpg"
        static let previewMovieID = "566525"
    }
    
    struct Views {
        
        struct HomeView {
            static let navTitle = "The movies App"
        }
        struct DetailView {
            static let navTitle = "Loading details ..."
            static let originalTitle = "Original Title:"
            static let originalTitleHere = "Original Title here..."
            static let rating = "Rating:"
            static let releaseDate = "Release Date:"
            static let releaseDateHere = "Release Date here..."
            static let synopsis = "Synopsis:"
            static let synopsisHere = "Synopsis here..."
            static let titleHere = "Title here"
        }
    }
    
}
