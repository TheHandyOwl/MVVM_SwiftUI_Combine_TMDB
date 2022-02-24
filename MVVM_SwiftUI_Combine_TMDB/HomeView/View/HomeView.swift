//
//  HomeView.swift
//  MVVM_SwiftUI_Combine_TMDB
//
//  Created by Carlos on 2/2/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    @State private var searchText = ""
    
    var searchResults: [Movie] {
        if searchText.isEmpty != true {
            let movies = self.viewModel.moviesArray.listOfMovies.filter { $0.title.lowercased().contains(searchText.lowercased()) }
            return movies
        } else {
            let movies = self.viewModel.moviesArray.listOfMovies
            return movies
        }
    }

    var body: some View {
        NavigationView {
            List(self.searchResults, id: \.movieID) { movie in
                NavigationLink {
                    DetailView(movieID: String(movie.movieID))
                } label: {
                    HStack{
                        HomeViewImageWithCache(imageString: movie.image)
                            .scaledToFit()
                            .frame(height: 180, alignment: .center)
                        VStack (alignment: .leading){
                            Text(movie.title)
                                .font(.title)
                                .bold()
                            Text(movie.sinopsis)
                                .font(.subheadline)
                                .lineLimit(3)
                        }
                    }
                }
            }
            .searchable(text: $searchText)
            .disableAutocorrection(true)
            .navigationTitle(Constants.Views.HomeView.navTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
