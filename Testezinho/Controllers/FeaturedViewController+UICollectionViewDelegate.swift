//
//  FeaturedViewController+UICollectionViewDelegate.swift
//  Testezinho
//
//  Created by MLaura on 13/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie: Movie
        // tinha um self antes do .popular
        if collectionView == self.popularCollectionView{
           // print (popularMovies[indexPath.item])
            movie = popularMovies[indexPath.item]
            
         // tinha um self antes do .nowplaying
        }else if collectionView == self.nowPlayingCollectionView{
            //print (nowPlayingMovies[indexPath.item])
           movie = nowPlayingMovies[indexPath.item]
        }else {
           // print (upcomingMovies[indexPath.item] )
            movie = upcomingMovies[indexPath.item]
        }
        self .performSegue(withIdentifier:"detailsSegue", sender: movie)
    }
}
