//
//  CoordinatorProtocol.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

protocol TabScreenCoordinator: AnyObject {
    
    var navigationController: UINavigationController { get }
    
    func makeTabScreen() -> UINavigationController
    
}
