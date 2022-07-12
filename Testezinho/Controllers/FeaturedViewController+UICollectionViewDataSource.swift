//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  Testezinho
//
//  Created by MLaura on 12/07/22.
//

import UIKit
extension FeaturedViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularCollectionView{
            return popularMovies.count
        } else if collectionView == nowPlayingCollectionView{
            return nowPlayingMovies.count
        }else if collectionView == upcomingCollectionView{
            return upcomingMovies.count
        }else
        { return 0}
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionView{
            if let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell{
                cell.titleLabel.text = popularMovies[indexPath.item].title
                cell.image.image = UIImage(named:popularMovies[indexPath.item].backdrop)
                return cell
            }
        }else if collectionView == nowPlayingCollectionView{
            if let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath) as? NowPlayingCollectionViewCell{
                cell.titleLabel.text = nowPlayingMovies[indexPath.item].title
                cell.dateLabel.text = nowPlayingMovies[indexPath.item].releaseDate
                cell.imageView.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
                return cell
            }
        } else if collectionView == upcomingCollectionView{
            if let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as? UpcomingCollectionViewCell{
                cell.titleLabel.text = upcomingMovies[indexPath.item].title
                cell.dateLabel.text = upcomingMovies[indexPath.item].releaseDate
                cell.image.image = UIImage(named: upcomingMovies[indexPath.item].poster)
                return cell
            }
}
        return UICollectionViewCell()
}
}
