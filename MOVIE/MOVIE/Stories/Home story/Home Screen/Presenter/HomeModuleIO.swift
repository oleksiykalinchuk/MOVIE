//
//  HomeModuleIO.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 26.03.2022.
//

import Foundation

protocol HomeModuleOutput: AnyObject {
    
    func didOpenMovieDetailInfoScreen(movieId: Int)
    
}
