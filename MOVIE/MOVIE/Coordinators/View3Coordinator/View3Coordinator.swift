//
//  View3Coordinator.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

final class View3Coordinator: Coordinator {
    
    unowned let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let screen = View3ModuleAssembly.buildModule()
        navigationController.pushViewController(screen, animated: true)
    }
    
}
