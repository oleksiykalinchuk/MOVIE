//
//  HomePresenter.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 26.03.2022.
//

import Foundation

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
