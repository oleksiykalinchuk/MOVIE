//
//  View2Coordinator.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

final class View2Coordinator: TabScreenCoordinator {
    
    lazy var navigationController: UINavigationController = {
        let screen = View2ModuleAssembly.buildModule(moduleOutput: self)
        return  UINavigationController(rootViewController: screen)
    }()
    
}

extension View2Coordinator: View2ModuleOutput {
    
    func didOpenView3() {
        let view3Coordinator = View3Coordinator(navigationController: navigationController)
        view3Coordinator.start()
    }
    
}
