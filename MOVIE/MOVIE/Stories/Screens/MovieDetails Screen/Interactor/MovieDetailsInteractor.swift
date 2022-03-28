//
//  MovieDetailsInteractor.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 28.03.2022.
//

import Foundation
import Moya

struct MovieDetailInteractor {
    
    // MARK: - Private variables
    
    private let movieService: MovieServiceProtocol
    
    // MARK: - Initializers
    
    init(movieService: MovieServiceProtocol) {
        self.movieService = movieService
    }
    
}

// MARK: - MovieDetailInteractorProtocol

extension MovieDetailInteractor: MovieDetailInteractorProtocol {
    
    func obtainMovieDetail(movieId: Int, completion: @escaping (Result<MovieDetailResponse, Error>) -> Void) {
        movieService.getMovieDetailInfo(movieId: movieId) { result in
            switch result {
            case let .success(response):
                completion(.success(response))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
}
