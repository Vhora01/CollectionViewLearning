//
//  CompositionalLayoutVC.swift
//  CollectionViewLearning
//
//  Created by Prakash on 25/03/26.
//

import UIKit

class CompositionalLayoutVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let imageArr : [UIImage] = [
        #imageLiteral(resourceName: "6"),
        #imageLiteral(resourceName: "5"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "7"),
        #imageLiteral(resourceName: "8"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "2"),
        #imageLiteral(resourceName: "6"),
        #imageLiteral(resourceName: "5"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "7"),
        #imageLiteral(resourceName: "8"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "2"),
        #imageLiteral(resourceName: "6"),
        #imageLiteral(resourceName: "5"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "7"),
        #imageLiteral(resourceName: "8"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "2"),
        #imageLiteral(resourceName: "6"),
        #imageLiteral(resourceName: "5"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "7"),
        #imageLiteral(resourceName: "8"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "2"),
        #imageLiteral(resourceName: "6"),
        #imageLiteral(resourceName: "5"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "7"),
        #imageLiteral(resourceName: "8"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "2"),
        #imageLiteral(resourceName: "6"),
        #imageLiteral(resourceName: "5"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "7"),
        #imageLiteral(resourceName: "8"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "2"),
        #imageLiteral(resourceName: "6"),
        #imageLiteral(resourceName: "5"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "7"),
        #imageLiteral(resourceName: "8"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "2"),
        #imageLiteral(resourceName: "6"),
        #imageLiteral(resourceName: "5"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "7"),
        #imageLiteral(resourceName: "8"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "2"),
        #imageLiteral(resourceName: "6"),
        #imageLiteral(resourceName: "5"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "7"),
        #imageLiteral(resourceName: "8"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "1"),
        #imageLiteral(resourceName: "2")

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }

    private func configureCollectionView(){
        collectionView.register(UINib(nibName: CollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier:  CollectionViewCell.cellIdentifier)
        collectionView.collectionViewLayout = CompositionalLayoutVC.createLayout()
        collectionView.dataSource = self
        
    }
    
    static func createLayout()->UICollectionViewCompositionalLayout{
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let verticleStackItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.5)
            )
        )
        
        verticleStackItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let verticleStackGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            ),
            subitem: verticleStackItem,
            count: 2
        )
        
//        let group = NSCollectionLayoutGroup.horizontal(
//            layoutSize: NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(1),
//                heightDimension: .fractionalHeight(2/5)
//            ),
//            subitem: item,
//            count: 2
//        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                                widthDimension: .fractionalWidth(1),
                                heightDimension: .fractionalHeight(2/5)
                            ),
            subitems: [item,verticleStackGroup]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
}


extension CompositionalLayoutVC : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.cellIdentifier, for: indexPath) as! CollectionViewCell
        cell.setImage(image: imageArr[indexPath.row])
        return cell
    }
}
