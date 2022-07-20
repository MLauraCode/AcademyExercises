//
//  TrendingCollectionViewCell.swift
//  Testezinho
//
//  Created by MLaura on 19/07/22.
//

import UIKit

class TrendingCollectionViewCell: UICollectionViewCell{
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    static let cellIdentifier = "TrendingCollectionViewCell"
    
    func setup(title:String, image:UIImage, date: String){
        titleLabel.text = title
        imageView.image = image
        dateLabel.text = String(date.prefix(4))
        
    }
}
 
