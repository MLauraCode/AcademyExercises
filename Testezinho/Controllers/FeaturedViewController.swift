//
//  FeaturedViewController.swift
//  Testezinho
//
//  Created by MLaura on 04/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    var popularMovies:[Movie] = [] // Movie.popularMovies()
    var nowPlayingMovies:[Movie] = [] // Movie.nowPlayingMovies()
    var upcomingMovies:[Movie] = [] //Movie.upcomingMovies()
    
    
    @IBOutlet var upcomingCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var popularCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        upcomingCollectionView.dataSource = self
        
        popularCollectionView.delegate = self
        nowPlayingCollectionView.delegate = self
        upcomingCollectionView.delegate = self
        
        Task{
            self.popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
        }
        Task{
            // TIREI SO PRA TESTAR
            self.nowPlayingMovies = await Movie.nowPlayingMoviesAPI()
            self.nowPlayingCollectionView.reloadData()
        }
        Task{
            self.upcomingMovies = await Movie.upcomingMoviesAPI()
            self.upcomingCollectionView.reloadData()
        }
    }
    
    // passar o filme adiante
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        guard let detailsViewController = segue.destination as? DetailsViewController else {return}
        guard let movie = sender as? Movie else {return}
        detailsViewController.movie = movie
        
    }
    
}
