//
//  LoadingIndicatorProtocol.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 28.03.2022.
//

protocol LoadingIndicatorDisplayable {
    
    var loadingIndicator: LoadingIndocatorView { get }

    func setLoading(_ isVisible: Bool)
    
}
extension LoadingIndicatorDisplayable {
    
    func setLoading(_ isVisible: Bool) {
        
        isVisible ? loadingIndicator.startAnimating() : loadingIndicator.stopAnimating()
    }
    
}
