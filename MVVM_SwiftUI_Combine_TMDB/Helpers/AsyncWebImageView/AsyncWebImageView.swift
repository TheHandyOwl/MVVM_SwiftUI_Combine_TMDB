//
//  AsyncWebImageView.swift
//  MVVM_SwiftUI_Combine_TMDB
//
//  Created by Carlos on 2/2/22.
//

import SwiftUI

struct AsyncWebImageView: View {
    
    @ObservedObject var binder = AsyncImageBinder()
    
    private var url: URL
    private var placeHolder: Image
    
    init(url: URL, placeHolder: Image) {
        self.url = url
        self.placeHolder = placeHolder
        
        self.binder.load(url: self.url)
    }
    
    var body: some View {
        VStack {
            if binder.image != nil {
                Image(uiImage: binder.image!)
                    .renderingMode(.original)
                    .resizable()
                    .onAppear { }
                    .onDisappear { }
            } else {
                placeHolder
                    .resizable()
                    .foregroundColor(.red)
                    .onAppear { }
                    .onDisappear { }
            }
            
        }
        .onAppear {  }
        .onDisappear { self.binder.cancel() }
    }
    
}

struct AsyncWebImageView_Previews: PreviewProvider {
    static let url = URL(string: Constants.Strings.previewImageFullUrl)!
    
    static var previews: some View {
        AsyncWebImageView(url: url, placeHolder: Image(systemName: Constants.Strings.placeholderImage)
        )
    }
}
