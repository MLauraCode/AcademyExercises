//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  Testezinho
//
//  Created by MLaura on 12/07/22.
//

import UIKit
extension FeaturedViewController:UICollectionViewDataSource{
    
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.popularCollectionView{
            return popularMovies.count
        } else if collectionView == self.nowPlayingCollectionView{
            return nowPlayingMovies.count
        }else{
            return upcomingMovies.count
    }
}
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            if collectionView == self.popularCollectionView{
                return makePopularCell(indexPath)
            }else if collectionView == self.nowPlayingCollectionView {
                return makeNowPlayingCell(indexPath)
                
                // upcoming ajeitada com suffix
            } else if collectionView == upcomingCollectionView{
                if let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell{
                    
                    cell.setup(title:upcomingMovies[indexPath.item].title, monthAndDay: "\(upcomingMovies[indexPath.item].releaseDate.suffix(4))",
                        image: UIImage(named:upcomingMovies[indexPath.item].posterPath) ?? UIImage())
                   //novo
                    let movie = upcomingMovies[indexPath.item]
                    
                    _Concurrency.Task{
                    let imageData = await Movie.downloadImageData(withPath:movie.posterPath)
                    let imagem = UIImage(data:imageData) ?? UIImage()
                        cell .setup(title: movie.title, monthAndDay: "\(upcomingMovies[indexPath.item].releaseDate.suffix(4))" , image: imagem)
                    }
                    
                    return cell
                }
            }
            return UICollectionViewCell()
        }
        
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        if let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell{
            
            cell.setup(title:popularMovies[indexPath.item].title,
                       image: UIImage())
            
          //novo
            let movie = popularMovies[indexPath.item]
            
           Task{
            let imageData = await Movie.downloadImageData(withPath:movie.backdropPath)
            let imagem = UIImage(data:imageData) ?? UIImage()
                cell.setup(title: movie.title, image: imagem)
            }
            
            return cell
        }
        return PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        if let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell{
            
            cell.setup(title:nowPlayingMovies[indexPath.item].title, year: "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))",
                image: UIImage(named:nowPlayingMovies[indexPath.item].posterPath) ?? UIImage())
            
            //novo
            let movie = nowPlayingMovies[indexPath.item]
            
           Task{
            let imageData = await Movie.downloadImageData(withPath:movie.posterPath)
            let imagem = UIImage(data:imageData) ?? UIImage()
                cell.setup(title: movie.title, year: "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))",image: imagem)
            }
            
            
            return cell
        }
        return NowPlayingCollectionViewCell()
    }
    
}
