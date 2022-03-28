//
//  FavouriteModuleAssembly.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

final class FavouriteModuleAssembly {
    
    static func buildModule() -> FavouriteScreen {
        let view = FavouriteScreen()
        let service = MovieService()
        let interactor = FavoriteInteractor(movieService: service)
        
        let presenter = FavouritePresenter(
            view: view,
            interactor: interactor
        )
        
        view.output = presenter
        return view
    }
    
}
