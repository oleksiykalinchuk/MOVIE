//
//  MainCoordinator.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

final class MainCoordinator: MainCoordinatorProtocol {
    
    // MARK: - Private variables
    
    private unowned let tabBarController: UITabBarController
    
    // MARK: - Public
    
    var childCoordinators: [TabScreenCoordinator] = [
        HomeCoordinator(),
        View2Coordinator()
    ]
    
    // MARK: - Initialization
    
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    // MARK: Functions 
    
    func start() {
        tabBarController.viewControllers = childCoordinators.map {
            $0.navigationController
        }
    }
    
}
