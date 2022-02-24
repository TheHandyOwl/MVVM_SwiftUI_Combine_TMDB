//
//  HomeViewModel.swift
//  MVVM_SwiftUI_Combine_TMDB
//
//  Created by Carlos on 2/2/22.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var moviesArray = Movies(listOfMovies: [])
    
    init() {
        let urlString = "\(Constants.API.URL.urlMainSite)\(Constants.API.Endpoints.urlEndpointListMovies)\(Constants.API.apiKeyBridge)\(Constants.API.apiKeyValue)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            do {
                guard let data = data else { return }
                let movies = try JSONDecoder().decode(Movies.self, from: data)
                DispatchQueue.main.async {
                    self.moviesArray = movies
                }
            } catch let error as NSError {
                print("No funciona la api: \(error.localizedDescription)")
            }
        }.resume()
    }
    
}
