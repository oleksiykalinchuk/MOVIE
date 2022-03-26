//
//  View1ModuleAssembly.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

final class HomeModuleAssembly {
    
    static func buildModule(moduleOutput: HomeModuleOutput) -> HomeScreen {
        let view = HomeScreen()
        let service = MovieService()
        let interactor = HomeInteractor(movieService: service)
        
        let presenter = HomePresenter(
            view: view,
            interactor: interactor,
            moduleOutput: moduleOutput
        )
        
        view.output = presenter
        return view
    }
    
}
