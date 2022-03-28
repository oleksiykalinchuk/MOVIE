//
//  View1ModuleAssembly.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

final class HomeModuleAssembly {
    
    static func buildModule() -> HomeScreen {
        let view = HomeScreen()
        let service = MovieService()
        let interactor = HomeInteractor(movieService: service)
        
        let presenter = HomePresenter(
            view: view,
            interactor: interactor
        )
        view.output = presenter
        return view
    }
    
}
