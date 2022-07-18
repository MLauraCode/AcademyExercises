//
//  DetailsViewController.swift
//  Testezinho
//
//  Created by MLaura on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var movie: Movie?
    
    
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        guard let movie = movie else {return}
        
        self.title = movie.title
        
        Task{
            // baixando backdrop
            let backdropImage = await Movie.downloadImageData(withPath:movie.backdropPath)
            let imageBackdrop = UIImage(data: backdropImage) ?? UIImage()
            self.backdropImage.image = imageBackdrop
            
            // baixando poster
            let posterImage = await Movie.downloadImageData(withPath:movie.posterPath)
            let imagemPoster = UIImage(data: posterImage)
            self.posterImage.image = imagemPoster
            
        }
        
        backdropImage.image = UIImage(named: movie.backdropPath)
        titleLabel.text = movie.title
        
        
        // novo
        posterImage.image = UIImage(named: movie.posterPath)
        ratingLabel.text = "Rating: \(movie.voteAverage)/10"
        overviewLabel.text = movie.overview
    
    }
    
    
}

