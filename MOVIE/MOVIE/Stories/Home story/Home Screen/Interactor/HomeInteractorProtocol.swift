//
//  SomeInteractorProtocol.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

protocol HomeInteractorProtocol {
    func obtainPopularMovies(page: Int,
                             completion: @escaping (Result<MoviesPageResponse, Error>) -> Void)
}

