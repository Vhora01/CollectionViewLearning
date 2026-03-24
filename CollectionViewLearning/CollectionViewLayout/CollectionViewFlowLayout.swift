//
//  File.swift
//  CollectionViewLearning
//
//  Created by Prakash on 25/03/26.
//

import Foundation
import UIKit


struct CollectionViewLayout {
    //set collection view flowlayout
    static func flowLayout(
        spacing:CGFloat,
        scrollDirection:UICollectionView.ScrollDirection,
        noOfCells:Int,
        collectionViewWidth :CGFloat
    )->UICollectionViewFlowLayout{
        let flowlayout = UICollectionViewFlowLayout()
        let sectionInsets = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        flowlayout.sectionInset = sectionInsets
        flowlayout.scrollDirection = scrollDirection
        
        let width = sectionInsets.left * CGFloat(noOfCells + 1)
        let cellWidth = (collectionViewWidth - width) / CGFloat(noOfCells)
        flowlayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        return flowlayout
    }
}
