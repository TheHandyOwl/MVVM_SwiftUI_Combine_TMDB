//
//  HomeViewImageWithCache.swift
//  MVVM_SwiftUI_Combine_TMDB
//
//  Created by Carlos on 2/2/22.
//

import SwiftUI

struct HomeViewImageWithCache: View {

    let imageString : String
    
    init(imageString: String) {
        self.imageString = imageString
    }

    var body: some View {
        let url = URL(string: Constants.API.URL.urlMainImagesW200 + imageString)!
        AsyncWebImageView(url: url, placeHolder: Image(systemName: Constants.Strings.placeholderImage))
    }

}

struct HomeViewImageWithCache_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewImageWithCache(imageString: Constants.Strings.previewImage)
    }
}
