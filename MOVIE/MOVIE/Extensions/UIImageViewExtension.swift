//
//  UIImageViewExtension.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 26.03.2022.
//

import UIKit

extension UIImageView {
    
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
