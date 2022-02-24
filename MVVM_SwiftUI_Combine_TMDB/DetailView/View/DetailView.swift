//
//  DetailView.swift
//  MVVM_SwiftUI_Combine_TMDB
//
//  Created by Carlos on 2/2/22.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var viewModel : DetailViewModel = DetailViewModel()
    
    init(movieID: String) {
        self.viewModel.getMovieDetail(movieID: movieID)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Text(viewModel.movieDetail?.title
                     ?? Constants.Views.DetailView.titleHere)
                    .font(.title)
                DetailViewImageWithCache(imageString: viewModel.movieDetail?.image ?? "")
                    .frame(width: 240, height: 320, alignment: .center)
                    .scaledToFit()
                VStack(alignment: .leading, spacing: 20) {
                    Text(Constants.Views.DetailView.synopsis)
                        .font(.headline)
                    Text(viewModel.movieDetail?.synopsis
                         ?? Constants.Views.DetailView.synopsisHere)
                        .font(.callout)
                    Text(Constants.Views.DetailView.releaseDate)
                        .font(.headline)
                    Text(viewModel.movieDetail?.releaseDate
                         ?? Constants.Views.DetailView.releaseDateHere)
                        .font(.callout)
                    Text(Constants.Views.DetailView.originalTitle)
                        .font(.headline)
                    Text(viewModel.movieDetail?.originalTitle
                         ?? Constants.Views.DetailView.originalTitleHere)
                        .font(.callout)
                    Text(Constants.Views.DetailView.rating)
                        .font(.headline)
                    Text(String(viewModel.movieDetail?.voteAverage ?? 0.0))
                        .font(.callout)
                }
            }
        }
        .padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
        .navigationTitle(viewModel.movieDetail?.title
                         ?? Constants.Views.DetailView.navTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movieID: Constants.Strings.previewMovieID)
    }
}
