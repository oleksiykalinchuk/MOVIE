//
//  HomeInteractorProtocol.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

protocol HomeInteractorProtocol {
    func obtainMovie(movieId: Int, completion: @escaping (Result<MovieDetailResponse, Error>) -> Void)
}
