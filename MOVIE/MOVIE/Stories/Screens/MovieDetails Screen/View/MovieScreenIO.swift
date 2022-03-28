//
//  MovieScreenIO.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 28.03.2022.
//

import UIKit

protocol MovieDetailsScreenInput: AnyObject {
    
    func setLoaderVisible(_ isVisible: Bool)
    func configure(model: MovieDetailsModel)
    
}

protocol MovieDetailsScreenOutput: AnyObject {
    
    func didFinishLoadingScreen()
    func didPressCircleImage(sender: UIViewController)
    
}
