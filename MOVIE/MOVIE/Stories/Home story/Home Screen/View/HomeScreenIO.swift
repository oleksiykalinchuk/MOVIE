//
//  HomeScreenIO.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 26.03.2022.
//

import Foundation

protocol HomeScreenOutput: AnyObject {
    
    func didSelectMovie(movieId: Int)
    
}

protocol HomeScreenInput: AnyObject {
    
}
