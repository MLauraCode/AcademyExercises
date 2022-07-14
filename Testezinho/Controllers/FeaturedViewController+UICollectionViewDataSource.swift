//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  Testezinho
//
//  Created by MLaura on 12/07/22.
//

import UIKit
extension FeaturedViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionView{
            return makePopularCell(indexPath)
        }else if collectionView == nowPlayingCollectionView{
            return makeNowPlayingCell(indexPath)
            
            // upcoming ajeitada com suffix
        } else if collectionView == upcomingCollectionView{
            if let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell{
                
                cell.setup(title:upcomingMovies[indexPath.item].title, monthAndDay: "\(upcomingMovies[indexPath.item].releaseDate.suffix(4))",
                    image: UIImage(named:upcomingMovies[indexPath.item].poster) ?? UIImage())
                
                return cell
            }
        }
        return UICollectionViewCell()
    }
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
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        if let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell{
            
            cell.setup(title:popularMovies[indexPath.item].title,
                       image: UIImage(named:popularMovies[indexPath.item].backdrop) ?? UIImage())
            
            
            return cell
        }
        return PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        if let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell{
            
            cell.setup(title:nowPlayingMovies[indexPath.item].title, year: "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))",
                image: UIImage(named:nowPlayingMovies[indexPath.item].poster) ?? UIImage())
            
            return cell
        }
        return NowPlayingCollectionViewCell()
    }
    
}

