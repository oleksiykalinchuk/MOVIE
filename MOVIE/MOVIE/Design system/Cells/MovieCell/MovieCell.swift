//
//  MovieCell.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 26.03.2022.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    // MARK: - Private
    
    // MARK: UI
    
    let posterImageView = makeImageView()
    let titleLabel = makeTitleLabel()
    let overviewLabel = makeOverviewLabel()
    let releaseDateLabel = makeReleaseLabel()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
        setupLayout()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: MovieCell.Model) {
        posterImageView.image = model.image
        titleLabel.text = model.title
        overviewLabel.text = model.overview
        releaseDateLabel.text = model.releaseDate
    }
    
}

// MARK: - Private functions

private extension MovieCell {
    
    // MARK: Setup
    
    func setupView() {
        backgroundColor = AppColors.background
    }
    
    func setupLayout() {
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let textLabelsStackView = UIStackView(
            arrangedSubviews: [titleLabel, overviewLabel, releaseDateLabel]
        )
        textLabelsStackView.axis = .vertical
        textLabelsStackView.spacing = 12
        textLabelsStackView.alignment = .top
        
        let totalStack = UIStackView(arrangedSubviews: [posterImageView, textLabelsStackView])
        addSubview(totalStack)
        
        totalStack.translatesAutoresizingMaskIntoConstraints = false
        totalStack.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            totalStack.topAnchor.constraint(equalTo: self.topAnchor),
            totalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            totalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            totalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}

// MARK: - View builders

private extension MovieCell {
    
    static func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .center
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    // MARK: Labels
    
    static func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Raleway-Bold", size: 14)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }
    
    static func makeOverviewLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Raleway-Regular", size: 12)
        label.textColor = UIColor(red: 0.771, green: 0.771, blue: 0.771, alpha: 1)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }
    
    static func makeReleaseLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "Raleway-SemiBold", size: 12)
        label.textColor = UIColor(red: 1, green: 0.612, blue: 0.029, alpha: 1)
        label.textAlignment = .left
        return label
    }
    
}
