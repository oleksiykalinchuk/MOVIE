//
//  MainCoordinatorProtocol.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

protocol MainCoordinatorProtocol {
    
    var childCoordinators: [TabScreenCoordinator] { get set }
    
    init(tabBarController: UITabBarController)
    
    func start()
    
}
