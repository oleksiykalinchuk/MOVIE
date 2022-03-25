//
//  ViewController2.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 25.03.2022.
//

import UIKit

class ViewController2: UIViewController {
    
    var delegate: View2ModuleOutput?

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarItem  = UITabBarItem(title: "Contest", image:  UIImage(named: "ico-contest"), tag: 1)
        title = "TItle 2"
        view.backgroundColor = .blue
        setupButton()
    }
    
    func setupButton() {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 200).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    @objc func actionButton() {
        delegate?.didOpenView3()
    }

}

protocol View2ModuleOutput {
    func didOpenView3()
}
