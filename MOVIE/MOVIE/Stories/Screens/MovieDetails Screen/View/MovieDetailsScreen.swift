//
//  ViewController2.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

final class MovieDetailsScreen: UIViewController {
    
    // MARK: - Public
    
    let loadingIndicator = LoadingIndocatorView(frame: .zero)
    
    var output: MovieDetailsScreenOutput!
    
    // MARK: - Private
    
    // MARK: UI
    
    private let thumbnailView = ThumbnailView()
    private let descriptionLabel = MovieCell.makeTitleLabel()
    private let overviewLabel = MovieCell.makeOverviewLabel()
    private let releaseLabel = MovieCell.makeReleaseLabel()

    override func loadView() {
        super.loadView()
        
        setupView()
        setupNavBar()
        setupThumbnailView()
        setupLayout()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        output.didFinishLoadingScreen()
    }

}

extension MovieDetailsScreen: MovieDetailsScreenInput {
    
    func configure(model: MovieDetailsModel) {
        thumbnailView.configure(
            model:
                ThumbnailView.Model(
                    title: model.title,
                    voteAvarage: model.voteAvarage,
                    imagePath: model.imagePath
                )
        )
        descriptionLabel.text = "Description:"
        overviewLabel.text = model.overview
        releaseLabel.text = "Release: \(model.releaseDate)"
    }
    
    func setLoaderVisible(_ isVisible: Bool) {
        setLoading(isVisible)
    }
    
}

// MARK: - LoadingIndicatorDisplayable

extension MovieDetailsScreen: LoadingIndicatorDisplayable { }

// MARK: - Private functions

private extension MovieDetailsScreen {
    
    // MARK: - Setup
    
    func setupView() {
        view.backgroundColor = AppColors.background
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.barStyle = .black
        guard let titleImage = UIImage(named: NavBarConstants.imageName).self,
              let buttonImage = UIImage(systemName: "chevron.backward") else { return }
        
        let backButton = UIBarButtonItem(image: buttonImage,
                                      style: .plain,
                                      target: navigationController,
                                      action: #selector(UINavigationController.popViewController(animated:)))
        backButton.tintColor = .white
        navigationItem.leftBarButtonItem = backButton
        setNavigationBarTitle(NavBarConstants.title, andImage: titleImage)
    }
    
    func setupThumbnailView() {
        thumbnailView.onTapPlayButton = { [weak self] in
            guard let self = self else { return }

            self.output.didPressCircleImage(sender: self)
        }
    }
    
    // MARK: Layout
    
    func setupLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        thumbnailView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(thumbnailView)
        NSLayoutConstraint.activate([
            thumbnailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            thumbnailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            thumbnailView.heightAnchor.constraint(equalToConstant: view.bounds.height / 4),
            thumbnailView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 28)
        ])
        
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: thumbnailView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
        ])
        
        view.addSubview(overviewLabel)
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                    constant: -32),
        ])
        
        view.addSubview(releaseLabel)
        NSLayoutConstraint.activate([
            releaseLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 16),
            releaseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            releaseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                    constant: -32),
        ])
        
        view.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
