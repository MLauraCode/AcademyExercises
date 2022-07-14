//
//  UpcomingCollectionViewCell.swift
//  Testezinho
//
//  Created by MLaura on 11/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "upcomingCell"
    @IBOutlet var image: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
        

    func setup(title: String,monthAndDay: String, image: UIImage){
        titleLabel.text = title
        dateLabel.text = monthAndDay
        self.image.image = image
    }
}
