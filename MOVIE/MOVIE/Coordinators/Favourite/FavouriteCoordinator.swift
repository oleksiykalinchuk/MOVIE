//
//  View2Coordinator.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

final class FavouriteCoordinator: TabScreenCoordinator {
    
    lazy var navigationController: UINavigationController = {
        let screen = FavouriteModuleAssembly.buildModule()
        return  UINavigationController(rootViewController: screen)
    }()
    
    func makeTabScreen() -> UINavigationController {
        let item = UITabBarItem(
            title: "Favourite",
            image: UIImage(systemName: "star"),
            tag: 1
        )
        
        navigationController.tabBarItem = item
        return navigationController
    }
    
}
