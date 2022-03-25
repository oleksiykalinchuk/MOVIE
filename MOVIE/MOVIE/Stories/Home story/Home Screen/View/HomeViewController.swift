//
//  ViewController.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 24.03.2022.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tabBarItem  = UITabBarItem(title: "Home", image: UIImage(named: "ico-home"), tag: 0)
        title = "TItle 1"
        view.backgroundColor = .red
        let service = MovieService()
        let interactor = HomeInteractor(movieService: service)
        interactor.obtainMovie(movieId: 508947) { result in
            switch result {
            case .success(let movie):
                print(movie)
            case .failure(let error):
                print(error)
            }
        }
    }

}

