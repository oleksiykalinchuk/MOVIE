//
//  HomePresenter.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 26.03.2022.
//

import UIKit

final class HomePresenter {

    // MARK: - Private
    
    // MARK: Variables
    
    private var pageNumber: Int = 1
    private var totalPages: Int = 1
    private var isPagingEnabled = true
    
    // MARK: External dependencies
    
    private unowned let view: HomeScreenInput
    private var interactor: HomeInteractorProtocol
    
    // MARK: - Initialization
    
    init(view: HomeScreenInput,
         interactor: HomeInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
}

// MARK: - HomeScreenOutput

extension HomePresenter: HomeScreenOutput {
    
    func didStartScrolling(scrollDirection: MoviesView.ScrollDirection) {
        
        if scrollDirection == .toTop, pageNumber > 1 {
            pageNumber -= 1
        } else if scrollDirection == .toBottom, pageNumber < totalPages {
            pageNumber += 1
        } else {
            return
        }
        obtainMoviesAt(page: pageNumber, pagination: true)
    }
    
    func didFinishLoadingScreen() {
        obtainMoviesAt(page: pageNumber, pagination: true)
    }

}

private extension HomePresenter {
    
    func obtainMoviesAt(page: Int, pagination: Bool) {
        guard isPagingEnabled, pageNumber <= totalPages else { return }

        isPagingEnabled = !pagination
        view.setLoaderVisible(true)
        
        interactor.obtainPopularMovies(page: page) { [weak self] result in
            guard let self = self else { return }
            
            self.view.setLoaderVisible(false)
            switch result {
            case let .success(response):
                self.totalPages = response.totalPages
                self.pageNumber = response.page
                let moviesModel = response.results.map { movie in
                    MovieCell.Model(
                        posterPath: movie.posterPath,
                        title: movie.title,
                        overview: movie.overview,
                        releaseDate: movie.releaseDate,
                        movieId: movie.id
                    )
                }
                self.view.configureViews(with: moviesModel)
            case .failure:
                self.view.configureViews(with: [])
            }
            self.isPagingEnabled = pagination
        }
    }
    
}
