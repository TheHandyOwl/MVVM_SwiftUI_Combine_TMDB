//
//  DetailViewModel.swift
//  MVVM_SwiftUI_Combine_TMDB
//
//  Created by Carlos on 2/2/22.
//

import Foundation
import SwiftUI
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var movieDetail : MovieDetail? = nil
    
    func getMovieDetail(movieID: String) {
        let urlString = "\(Constants.API.URL.urlMainSite)\(Constants.API.Endpoints.urlEndpointDetailMovie)\(movieID)\(Constants.API.apiKeyBridge)\(Constants.API.apiKeyValue)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            do {
                guard let data = data else { return }
                let detailMovie = try JSONDecoder().decode(MovieDetail.self, from: data)
                DispatchQueue.main.async {
                    self.movieDetail = detailMovie
                }
            } catch let error as NSError {
                print("No funciona la api: \(error.localizedDescription)")
            }
        }.resume()
    }
    

}
