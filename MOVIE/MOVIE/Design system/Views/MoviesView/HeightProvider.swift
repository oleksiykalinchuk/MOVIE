//
//  HeightProvider.swift
//  MOVIE
//
//  Created by Oleksii Kalinchuk on 27.03.2022.
//

import UIKit

enum LabelType {
    case title
    case overview
    case releaseDate
}

struct HeightProvider {
    
    private unowned let collectionView: UICollectionView
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    func getRequiredHeightFor(type: LabelType, text: String) -> CGFloat {
        let label: UILabel
        
        switch type {
        case .title:
            label = MovieCell.makeTitleLabel()
        case .overview:
            label = MovieCell.makeOverviewLabel()
        case .releaseDate:
            label = MovieCell.makeReleaseLabel()
        }
        
        label.text = text
        let widthOfLabel = collectionView.bounds.width * CellConstants.textLabelsMultiplier
        let maxSize = CGSize(width: widthOfLabel, height: .greatestFiniteMagnitude)
        let size = label.sizeThatFits(maxSize)
        
        return size.height
    }
    
}



