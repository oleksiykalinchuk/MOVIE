//
//  MovieDetailsPresenter.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 28.03.2022.
//

import UIKit

final class MoviePresenter {
    
    private let movieId: Int
    
    // MARK: External dependencies
    
    private unowned let view: MovieDetailsScreenInput
    private var interactor: MovieDetailInteractorProtocol
    private var state: MovieDetailsModel?
    
    // MARK: - Initialization
    
    init(view: MovieDetailsScreenInput,
         interactor: MovieDetailInteractorProtocol,
         movieId: Int) {
        self.view = view
        self.interactor = interactor
        self.movieId = movieId
    }
    
}

// MARK: - MovieScreenOutput

extension MoviePresenter: MovieDetailsScreenOutput {
    
    func didFinishLoadingScreen() {
        obtainMovieInfo()
    }
    
    func didPressCircleImage(sender: UIViewController) {
        guard let movieName = state?.title else { return }
        
        let alert = UIAlertController(title: movieName,
                                      message: nil,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        sender.present(alert, animated: true, completion: nil)
    }
    
}

// MARK: - Private functions

private extension MoviePresenter {
    
    func obtainMovieInfo() {
        view.setLoaderVisible(true)
        interactor.obtainMovieDetail(movieId: movieId) { [weak self] result in
            guard let self = self else { return }
            
            self.view.setLoaderVisible(false)
            switch result {
            case let .success(response):
                let movieInfo = MovieDetailsModel(
                    title: response.title,
                    voteAvarage: response.voteAverage,
                    overview: response.overview,
                    releaseDate: response.releaseDate,
                    imagePath: response.backdropPath
                )
                
                self.state = movieInfo
                self.view.configure(model: movieInfo)
            case let .failure(error):
                print(error)
            }
        }
    }
    
}
