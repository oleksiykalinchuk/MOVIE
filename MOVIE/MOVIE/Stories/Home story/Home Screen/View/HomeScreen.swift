//
//  HomeScreen.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 24.03.2022.
//

import UIKit

final class HomeScreen: UIViewController {
    
    // MARK: - Public
    
    // MARK: External dependencies
    
    var output: HomeScreenOutput!
    
    // MARK: - Private
    
    // MARK: UI
    
    private let moviesView = MoviesView()

    override func loadView() {
        super.loadView()
        
        setupView()
        setupNavBar()
        setupMoviesView()
        setupLayout()
    }

}

// MARK: - HomeScreenInput

extension HomeScreen: HomeScreenInput {}

// MARK: - Private functions

private extension HomeScreen {
    
    // MARK: - Setup
    
    func setupView() {
        view.backgroundColor = AppColors.background
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.barStyle = .black
        guard let titleImage = UIImage(named: NavBarConstants.imageName) else { return }
        
        setNavigationBarTitle(NavBarConstants.title, andImage: titleImage)
    }
    
    func setupMoviesView() {
        moviesView.onSelectItem = { [weak self] movieId in
            self?.output.didSelectMovie(movieId: movieId)
        }
    }
    
    // MARK: Layout
    
    func setupLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(moviesView)
        moviesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moviesView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            moviesView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            moviesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}
