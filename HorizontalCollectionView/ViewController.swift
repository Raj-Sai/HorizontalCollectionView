//
//  ViewController.swift
//  HorizontalCollectionView
//
//  Created by Amsaraj Mariappan on 23/7/2562 BE.
//  Copyright © 2562 Amsaraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet var collectionViewHeightConstraint: NSLayoutConstraint!
    
    private var data: [ExampleModel] = ExampleData.dataSet1
    
    private enum Segment: Int {
        case dataSet1 = 0, dataSet2, dataSet3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectioView()
    }
    
    private func setupCollectioView() {
        let nib = UINib(nibName: Constants.exampleCellReuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: Constants.exampleCellReuseIdentifier)
        
        let edgeInsets = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        flowLayout.sectionInset = edgeInsets
        
        setCollectionViewHeight(with: data, edgeInsets: flowLayout.sectionInset)
    }
    
    private func setCollectionViewHeight(with data: [ExampleModel], edgeInsets: UIEdgeInsets) {

        flowLayout.itemSize = CGSize(width: Constants.cardWidth, height: 270)
        
        collectionViewHeightConstraint.constant = 270 + edgeInsets.top + edgeInsets.bottom
    }
    
    // MARK: - UICollectionViewDatasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        if collectionView.numberOfItems(inSection: 0) < 3 {
        let totalCellWidth = 270 * collectionView.numberOfItems(inSection: 0)
        let totalSpacingWidth = 40 * (collectionView.numberOfItems(inSection: 0) - 1)

        let leftInset = (collectionView.layer.frame.size.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset

        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.exampleCellReuseIdentifier, for: indexPath) as! ExampleCell
        let example = data[indexPath.item]
        let viewModel = ExampleViewModel(example: example)
        
        cell.configure(with: viewModel)
        
        return cell
    }
    
    // MARK: - Segmented Control

    @IBAction func valueChanged(_ sender: UISegmentedControl) {
//        guard let segment = Segment(rawValue: sender.selectedSegmentIndex) else {
//            fatalError("Invalid value returned from segmented control")
//        }
//
//        switch segment {
//        case .dataSet1:
//            data = ExampleData.dataSet1
//        case .dataSet2:
//            data = ExampleData.dataSet2
//        case .dataSet3:
//            data = ExampleData.dataSet3
//        }
//
//        setCollectionViewHeight(with: data, edgeInsets: flowLayout.sectionInset)
//
//        flowLayout.invalidateLayout()
//        collectionView.reloadData()
    }
    
}

