//
//  HomeInteractor.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import Foundation

struct HomeInteractor {
    
    // MARK: - Private variables
    
    private let movieService: MovieServiceProtocol
    
    // MARK: - Initializers
    
    init(movieService: MovieServiceProtocol) {
        self.movieService = movieService
    }
    
}

// MARK: - HomeInteractorProtocol

extension HomeInteractor: HomeInteractorProtocol {
    
    func obtainMovie(movieId: Int, completion: @escaping (Result<MovieDetailResponse, Error>) -> Void) {
        movieService.getMovieDetailInfo(movieId: movieId) { result in
            switch result {
            case let .success(responce):
                completion(.success(responce))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
}
