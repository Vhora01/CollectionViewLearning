//
//  ListViewController.swift
//  CollectionViewLearning
//
//  Created by Prakash on 26/03/26.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var listCollectionView: UICollectionView!
    let arrTitle : [Int] = Array(0...100)
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    private func configureCollectionView(){
        listCollectionView.register(ListCell.nib(), forCellWithReuseIdentifier: ListCell.cellIdentifier)
        listCollectionView.dataSource = self
        listCollectionView.collectionViewLayout = CollectionViewLayout.asTableViewCellLayout(contentInSet: 5, cellHeight: 50)
    }
}

extension ListViewController : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrTitle.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.cellIdentifier, for: indexPath) as! ListCell
        cell.stTitle(strTitle: "Item \(arrTitle[indexPath.row] + 1)")
        return cell
    }
}
