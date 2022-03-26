//
//  View2Coordinator.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

final class FavoriteCoordinator: TabScreenCoordinator {
    
    lazy var navigationController: UINavigationController = {
        let screen = FavoriteModuleAssembly.buildModule()
        return  UINavigationController(rootViewController: screen)
    }()
    
    func makeTabScreen() -> UINavigationController {
        let item = UITabBarItem(title: "Second", image: UIImage(systemName: "house"), tag: 1)
        navigationController.tabBarItem = item
        return navigationController
    }
    
}
