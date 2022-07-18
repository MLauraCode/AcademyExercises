//
//  NowPlayingCollectionViewCell.swift
//  Testezinho
//
//  Created by MLaura on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "nowPlayingCell"
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    
    func setup(title: String, year:String, image: UIImage){
        titleLabel.text = title
        dateLabel.text = year
        // tinha um self antes de imageView
        self.imageView.image = image
    }
}
