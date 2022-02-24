//
//  AsyncImageBinder.swift
//  MVVM_SwiftUI_Combine_TMDB
//
//  Created by Carlos on 2/2/22.
//

import Foundation
import Combine
import UIKit

class AsyncImageBinder: ObservableObject {
    
    @Published private(set) var image: UIImage?
    
    private var cache = AsyncImageCache.shared
    private var subscription: AnyCancellable?
    
    func load(url: URL) {
        
        if let image: UIImage = cache[url.absoluteString] {
            self.image = image
            return
        }
        
        subscription = URLSession.shared
            .dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .handleEvents(receiveOutput: { self.cache[url.absoluteString] = $0 })
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func cancel() {
        subscription?.cancel()
    }
    
}
