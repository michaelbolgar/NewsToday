//
//  ImageCache.swift
//  NewsToday
//
//  Created by Анастасия on 26.03.2024.
//

import UIKit

class ImageCache {
        static let shared = ImageCache()

        private let cache = NSCache<NSString, UIImage>()

        func setImage(_ image: UIImage, forKey key: String) {
            cache.setObject(image, forKey: key as NSString)
        }
        func getImage(forKey key: String) -> UIImage? {
            return cache.object(forKey: key as NSString)
    }
}

