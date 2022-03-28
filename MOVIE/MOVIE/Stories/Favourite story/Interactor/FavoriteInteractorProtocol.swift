//
//  FavoriteInteractorProtocol.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

protocol FavoriteInteractorProtocol {
    func obtainTopRatedMovie(page: Int,
                             completion: @escaping (Result<MoviesPageResponse, Error>) -> Void)
}
