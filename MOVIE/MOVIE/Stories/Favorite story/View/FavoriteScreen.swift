//
//  FavoriteScreen.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

final class FavoriteScreen: UIViewController {

    override func loadView() {
        super.loadView()
        
        setupView()
        setupNavBar()
    }
}

// MARK: - Private functions

private extension FavoriteScreen {
    
    // MARK: - Setup
    
    func setupView() {
        view.backgroundColor = AppColors.background
        navigationController?.navigationBar.barStyle = .black
    }
    
    func setupNavBar() {
        guard let titleImage = UIImage(named: NavBarConstants.imageName) else {
            return
        }
        setNavigationBarTitle(NavBarConstants.title, andImage: titleImage)
    }
    
}
