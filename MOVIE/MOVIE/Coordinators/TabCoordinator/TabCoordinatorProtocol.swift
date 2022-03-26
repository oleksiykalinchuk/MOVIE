//
//  TabCoordinatorProtocol.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

protocol TabCoordinatorProtocol {
    
    var childCoordinators: [TabScreenCoordinator] { get set }
    
    init(tabBarController: UITabBarController)
    
    func start()
    
}
