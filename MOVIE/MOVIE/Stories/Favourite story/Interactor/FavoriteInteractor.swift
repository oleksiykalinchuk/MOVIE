//
//  FavoriteInteractor.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import Foundation

struct FavoriteInteractor {
    
    // MARK: - Private variables
    
    private let movieService: MovieServiceProtocol
    
    // MARK: - Initializers
    
    init(movieService: MovieServiceProtocol) {
        self.movieService = movieService
    }
    
}

// MARK: - FavoriteInteractorProtocol

extension FavoriteInteractor: FavoriteInteractorProtocol {
    
    func obtainTopRatedMovie(page: Int,
                             completion: @escaping (Result<MoviesPageResponse, Error>) -> Void) {
        movieService.getTopRatedMovies(page: page) { result in
            switch result {
            case let .success(responce):
                completion(.success(responce))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
}
