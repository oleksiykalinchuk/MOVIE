//
//  FavouriteScreenIO.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 27.03.2022.
//

import Foundation

protocol FavouriteScreenOutput: AnyObject {
    
    func didStartScrolling(scrollDirection: MoviesView.ScrollDirection)
    func didFinishLoadingScreen() 
    
}

protocol FavouriteScreenInput: AnyObject {
    
    func configureViews(with movies: [MovieCell.Model])
    func setLoaderVisible(_ isVisible: Bool)
    
}
