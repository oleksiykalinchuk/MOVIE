//
//  HomePresenter.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 26.03.2022.
//

import UIKit

final class HomePresenter {
    
    // MARK: - Private
    
    // MARK: External dependencies
    
    private unowned let view: HomeScreenInput
    private let interactor: HomeInteractorProtocol
    private weak var moduleOutput: HomeModuleOutput?
    
    // MARK: - Initialization
    
    init(view: HomeScreenInput,
         interactor: HomeInteractorProtocol,
         moduleOutput: HomeModuleOutput) {
        self.view = view
        self.interactor = interactor
        self.moduleOutput = moduleOutput
    }
    
}

// MARK: - HomeScreenOutput

extension HomePresenter: HomeScreenOutput {
    
    func didSelectMovie(movieId: Int) {
        
    }
    
}

private extension HomePresenter {
    
    func obtainMovies() {
        let model = MovieCell.Model(
            image: UIImage(systemName: "house")!,
            title: "Turning Red",
            overview: "Thirteen-year-old Mei is experiencing the awkwardness of being a teenager with a twist – when she gets too excited, she transforms into a giant red panda. авиаивавиарвилравилраол р овираолвираовир аволира волираовилраолвираолвраоивраивлораивлораиволраол роливарволиарвоиравиолраоливраовилраловиравоираивораивлоравилоравиолраоливраиволравиолраиолра ивораиволр лоивр аиолвраолив раволи раволир ваиолра олвирвоиалр ивораиловр аивл",
            releaseDate: "2022-03-10",
            movieId: 5
        )
        interactor.obtainPopularMovies(page: 1) { result in
            if let movies = try? result.get() {
                let posterPath = movies.results[0].posterPath
                let image = UIImageView()
                image.loadFrom(URLAddress: "https://image.tmdb.org/t/p/w500\(posterPath)")
                if let imagePoster = image.image {
                    let movieCellModel = movies.results.map { movie in
                        MovieCell.Model(
                            image: imagePoster,
                            title: movie.title,
                            overview: movie.overview,
                            releaseDate: movie.releaseDate,
                            movieId: movie.id
                        )
                    }
                }
            }
        }
    }
    
}
