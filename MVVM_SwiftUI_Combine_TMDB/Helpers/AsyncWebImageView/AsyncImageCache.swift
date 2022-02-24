//
//  AsyncImageCache.swift
//  MVVM_SwiftUI_Combine_TMDB
//
//  Created by Carlos on 2/2/22.
//

import Foundation
import UIKit

class AsyncImageCache {
    
    static let shared = AsyncImageCache()
    
    private var cache: NSCache = NSCache<NSString, UIImage>()
    
    subscript(key: String) -> UIImage? {
        get { cache.object(forKey: key as NSString) }
        set(image) { image == nil ? self.cache.removeObject(forKey: (key as NSString)) : self.cache.setObject(image!, forKey: (key as NSString)) }
    }
    
}
