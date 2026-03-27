//
//  ListCell.swift
//  CollectionViewLearning
//
//  Created by Prakash on 26/03/26.
//

import UIKit

class ListCell: UICollectionViewCell {
    
    static let cellIdentifier = "ListCell"

    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customizeView()
    }
    
    func stTitle(strTitle:String){
        lblTitle.text = strTitle
    }

    static func nib()->UINib{
        return UINib(nibName: "ListCell", bundle: nil)
    }
}
