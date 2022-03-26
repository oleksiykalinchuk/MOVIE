//
//  View1Coordinator.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

final class HomeCoordinator: TabScreenCoordinator {
    
    lazy var navigationController: UINavigationController = {
        let screen = HomeModuleAssembly.buildModule(moduleOutput: self)
        return  UINavigationController(rootViewController: screen)
    }()
    
    func makeTabScreen() -> UINavigationController {
        let item = UITabBarItem(
            title: TabBarConstants.homeTitle,
            image: UIImage(systemName: TabBarConstants.homeImageName),
            tag: 0
        )
        
        navigationController.tabBarItem = item
        return navigationController
    }
    
}

// MARK: - HomeModuleOutput

extension HomeCoordinator: HomeModuleOutput {
    
    func didOpenMovieDetailInfoScreen(movieId: Int) {
        
    }
    
}
