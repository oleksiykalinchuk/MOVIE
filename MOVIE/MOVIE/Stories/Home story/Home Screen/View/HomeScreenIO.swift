//
//  HomeScreenIO.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 26.03.2022.
//

import Foundation
import UIKit

protocol HomeScreenOutput: AnyObject {
    
    func didStartScrolling(scrollDirection: MoviesView.ScrollDirection)
    func didFinishLoadingScreen()
    
}

protocol HomeScreenInput: AnyObject {
    
    func configureViews(with movies: [MovieCell.Model])
    func setLoaderVisible(_ isVisible: Bool)
    
}
