//
//  ImageHeightProvider.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 27.03.2022.
//

import UIKit

class ImageDataProvider {
    
    static let shared = ImageDataProvider()
    
    var height: CGFloat
    
    private init() {
        height = .zero
    }
    
}
