//
//  SceneDelegate.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 24.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let tabBar = UITabBarController()
        window.rootViewController = tabBar
        
        let tabCoordinator = TabCoordinator(tabBarController: tabBar)
        tabCoordinator.start()
        
        window.makeKeyAndVisible()
        self.window = window
    }

}

