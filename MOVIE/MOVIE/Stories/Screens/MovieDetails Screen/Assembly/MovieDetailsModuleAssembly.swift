//
//  View3ModuleAssembly.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit
import SwiftUI

final class MovieDetailsModuleAssembly {
    
    static func buildModule(movieId: Int) -> MovieDetailsScreen {
        let view = MovieDetailsScreen()
        let service = MovieService()
        let interactor = MovieDetailInteractor(movieService: service)
        
        let presenter = MoviePresenter(view: view, interactor: interactor, movieId: movieId)
        view.output = presenter
        
        return view
    }
    
}
