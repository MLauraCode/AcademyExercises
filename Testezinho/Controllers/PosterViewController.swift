//
//  PosterViewController.swift
//  Testezinho
//
//  Created by MLaura on 19/07/22.
//

import UIKit
    class PosterViewController: UIViewController{
        var movie: Movie?
        
        
        
        @IBOutlet var posterImageView:UIImageView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            guard let movie = movie else{
                return
            }
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
                let imagem = UIImage(data: imageData) ?? UIImage()
                
                self.posterImageView.image = imagem
            }
            posterImageView.image = UIImage(named:movie.posterPath)
        }


}
