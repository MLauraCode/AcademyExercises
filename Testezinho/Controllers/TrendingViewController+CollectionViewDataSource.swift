//
//  TrendingDelegateSource.swift
//  Testezinho
//
//  Created by MLaura on 19/07/22.
//

import UIKit
extension TrendingViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trendingMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return makeTrendingCell(indexPath)
    }
    
    fileprivate func makeTrendingCell(_ indexPath:IndexPath) -> TrendingCollectionViewCell{
        if let cell =
            trendingCollectionView
            .dequeueReusableCell(withReuseIdentifier: TrendingCollectionViewCell.cellIdentifier, for: indexPath) as?
            TrendingCollectionViewCell{
            cell.setup(title:trendingMovies[indexPath.item].title,image:UIImage(),
                       date: trendingMovies[indexPath.item].releaseDate)
            let movie = trendingMovies[indexPath.item]
            Task{
                let imageData = await
                Movie.downloadImageData(withPath: movie.posterPath)
                let imagem = UIImage(data:imageData) ?? UIImage()
                cell.setup(title: movie.title, image: imagem, date: movie.releaseDate)
                
            }
            return cell
        }
        return TrendingCollectionViewCell()
    }
}
