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
    
    func obtainPopularMovies(page: Int,
                             completion: @escaping (Result<MoviesPageResponse, Error>) -> Void) {
        movieService.getPopularMovies(page: page) { result in
            switch result {
            case let .success(responce):
                // TODO: logic with getting image here
                completion(.success(responce))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
}
