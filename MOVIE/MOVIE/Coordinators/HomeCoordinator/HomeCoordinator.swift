//
//  View1Coordinator.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

final class HomeCoordinator: TabScreenCoordinator {
    
    lazy var navigationController: UINavigationController = {
        let screen = HomeModuleAssembly.buildModule()
        return  UINavigationController(rootViewController: screen)
    }()
    
}
