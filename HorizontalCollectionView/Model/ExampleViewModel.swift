//
//  ExampleViewModel.swift
//  HorizontalCollectionView
//
//  Created by Amsaraj Mariappan on 23/7/2562 BE.
//  Copyright © 2562 Amsaraj. All rights reserved.
//

import UIKit

struct ExampleViewModel: HeightCalculation {
    
    let title: String
    let body: String?
    
    init(example: ExampleModel) {
        title = example.title
        body = example.body
    }
    
    public func height(forWidth width: CGFloat) -> CGFloat {
        let sizingLabel = UILabel()
        sizingLabel.numberOfLines = 0
        sizingLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        sizingLabel.lineBreakMode = .byTruncatingTail
        sizingLabel.text = body
        
        let maxSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        let size = sizingLabel.sizeThatFits(maxSize)
        
        return size.height
    }
    
}
