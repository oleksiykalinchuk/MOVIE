//
//  View2ModuleAssembly.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

final class View2ModuleAssembly {
    
    static func buildModule(moduleOutput: View2ModuleOutput?) -> ViewController2 {
        let screen = ViewController2()
        screen.delegate = moduleOutput
        return screen
    }
    
}
