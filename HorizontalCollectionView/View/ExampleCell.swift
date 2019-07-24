//
//  ExampleCell.swift
//  HorizontalCollectionView
//
//  Created by Amsaraj Mariappan on 23/7/2562 BE.
//  Copyright © 2562 Amsaraj. All rights reserved.
//

import UIKit

final class ExampleCell: UICollectionViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var body: UILabel!
    
    private static let sizingCell = UINib(nibName: Constants.exampleCellReuseIdentifier, bundle: nil).instantiate(withOwner: nil, options: nil).first! as! ExampleCell
    
    public func configure(with viewModel: ExampleViewModel, isSizing: Bool = false) {
        body.text = viewModel.body
        
        guard !isSizing else {
            return
        }
        
        title.text = viewModel.title
    }
}
