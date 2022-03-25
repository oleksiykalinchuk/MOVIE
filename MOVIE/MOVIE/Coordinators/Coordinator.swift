//
//  Coordinator.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

protocol Coordinator: AnyObject {

    init(navigationController: UINavigationController)
    
    func start()
    
}
