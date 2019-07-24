//
//  HeightCalculation.swift
//  HorizontalCollectionView
//
//  Created by Amsaraj Mariappan on 23/7/2562 BE.
//  Copyright © 2562 Amsaraj. All rights reserved.
//

import UIKit

protocol HeightCalculation {
    func height(forWidth: CGFloat) -> CGFloat
}

func calculateHeighest<T: HeightCalculation>(with viewModels: [T], forWidth width: CGFloat) -> T? {
    var largestViewModel = viewModels.first
    var largestHeight: CGFloat = 0
    
    for viewModel in viewModels {
        let height = viewModel.height(forWidth: width)
        
        if height > largestHeight {
            largestHeight =  height
            largestViewModel = viewModel
        }
    }
    
    return largestViewModel
}
