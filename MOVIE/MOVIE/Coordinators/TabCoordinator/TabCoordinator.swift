//
//  TabCoordinator.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

final class TabCoordinator: TabCoordinatorProtocol {
    
    // MARK: - Private variables
    
    private unowned let tabBarController: UITabBarController
    
    // MARK: - Public
    
    var childCoordinators: [TabScreenCoordinator] = [
        HomeCoordinator(),
        FavoriteCoordinator()
    ]
    
    // MARK: - Initialization
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    // MARK: Functions 
    
    func start() {
        tabBarController.viewControllers = childCoordinators.map {
            $0.makeTabScreen()
        }
        tabBarController.tabBar.unselectedItemTintColor = .white
        tabBarController.tabBar.backgroundColor = AppColors.tabBarBackground
        tabBarController.tabBar.tintColor = .orange
    }
    
}
