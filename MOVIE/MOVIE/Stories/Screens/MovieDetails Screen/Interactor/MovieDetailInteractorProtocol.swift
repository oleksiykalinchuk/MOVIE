//
//  MovieDetailInteractorProtocol.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 28.03.2022.
//

import Foundation

protocol MovieDetailInteractorProtocol {
    
    func obtainMovieDetail(movieId: Int,
                           completion: @escaping (Result<MovieDetailResponse, Error>) -> Void)
    
}
