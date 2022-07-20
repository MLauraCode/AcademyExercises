//
//  TrendingViewDelegate.swift
//  Testezinho
//
//  Created by MLaura on 19/07/22.
//

import UIKit

extension TrendingViewController:
    UICollectionViewDelegate{
    func collectionView(_ collectionView:UICollectionView,didSelectItemAt indexPath: IndexPath){
        
        self.performSegue(withIdentifier: "trendingSegue", sender: trendingMovies[indexPath.item])
    }

    
}
