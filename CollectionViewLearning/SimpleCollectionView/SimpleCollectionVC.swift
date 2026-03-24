//
//  ViewController.swift
//  CollectionView_Demo
//
//  Created by Prakash on 04/03/23.
//

import UIKit

class SimpleCollectionVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let noOfCells = 2
    let imageArr : [UIImage] = [#imageLiteral(resourceName: "6"),#imageLiteral(resourceName: "5"),#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "7"),#imageLiteral(resourceName: "8"),#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FlowLayout"
        self.configureCollectionView()
        self.configureCollectionViewLayout()
    }
    
    private func configureCollectionView(){
        collectionView.register(UINib(nibName: CollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    private func configureCollectionViewLayout(){
        collectionView.collectionViewLayout = CollectionViewLayout.flowLayout(spacing: 10, scrollDirection: .vertical, noOfCells: noOfCells, collectionViewWidth: collectionView.frame.width)
    }
}



extension SimpleCollectionVC : UICollectionViewDataSource,UICollectionViewDelegate{
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




