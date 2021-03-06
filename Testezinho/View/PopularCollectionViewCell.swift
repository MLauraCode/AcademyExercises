//
//  PopularCollectionViewCell.swift
//  Testezinho
//
//  Created by MLaura on 11/07/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "popularCell"
    @IBOutlet var image: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    func setup(title: String, image: UIImage){
        titleLabel.text = title
        self.image.image = image
    }
    
}
