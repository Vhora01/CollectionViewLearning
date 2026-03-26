//
//  CollectionViewCell.swift
//  CollectionView_Demo
//
//  Created by Prakash on 04/03/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView : UIImageView!
    static let cellIdentifier = "CollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        imageView.image = UIImage(named: "birds")
//        imageView.contentMode = .scaleAspectFill
//        imageView.layer.cornerRadius = 10
//        imageView.layer.shadowColor = UIColor.gray.cgColor
//        imageView.layer.shadowOpacity = 0.5
//        imageView.layer.shadowOffset = CGSize(width: 100.0, height: 100.0)
        imageView.layer.masksToBounds  = true
        imageView.layer.shadowColor = UIColor.gray.cgColor
        imageView.layer.shadowOpacity = 0.3
        imageView.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        imageView.layer.cornerRadius = 10
    }
    
    func setImage(image:UIImage){
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
    }

}
