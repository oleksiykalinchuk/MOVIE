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
    
    // MARK: UI
    
    let loadingIndicator = LoadingIndocatorView(frame: .zero)
    
    // MARK: - Private
    
    private let moviesView = MoviesView()

    override func loadView() {
        super.loadView()
        
        setupView()
        setupNavBar()
        setupMoviesView()
        setupLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.didFinishLoadingScreen()
    }

}

// MARK: - HomeScreenInput

extension HomeScreen: HomeScreenInput {
    
    func configureViews(with movies: [MovieCell.Model]) {
        guard !movies.isEmpty else { return }
        
        moviesView.movies = movies
        moviesView.collectionView.reloadData()
        moviesView.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0),
                                               at: .top,
                                               animated: true)
    }
    
    func setLoaderVisible(_ isVisible: Bool) {
        setLoading(isVisible)
    }
    
}

// MARK: - LoadingIndicatorProtocol

extension HomeScreen: LoadingIndicatorDisplayable { }

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
            let movieDetailsScreen = MovieDetailsModuleAssembly.buildModule(movieId: movieId)
            self?.navigationController?.pushViewController(movieDetailsScreen, animated: false)
        }
        moviesView.didScrollAllMovies = { [weak self] scrollDirection in
            self?.output.didStartScrolling(scrollDirection: scrollDirection)
        }
    }
    
    // MARK: Layout
    
    func setupLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(moviesView)
        moviesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moviesView.topAnchor.constraint(equalTo: safeArea.topAnchor,
                                            constant: Insets.mediumInset),
            moviesView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            moviesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        view.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.topAnchor.constraint(equalTo: safeArea.topAnchor,
                                                  constant: Insets.topInsetForLoader),
        ])
    }
    
}
