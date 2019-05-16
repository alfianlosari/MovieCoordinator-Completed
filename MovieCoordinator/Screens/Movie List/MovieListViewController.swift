//
//  ViewController.swift
//  MovieCoordinator
//
//  Created by Alfian Losari on 16/05/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

protocol MovieListViewControllerDelegate: class {
    
    func movieListViewController(_ controller: MovieListViewController, didSelect movie: Movie)
    
}

class MovieListViewController: UICollectionViewController {
    
    weak var delegate: MovieListViewControllerDelegate?
    
    var movies: [Movie] = Movie.dummyMovies
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        title = "Movies"
        collectionView.register(MovieCollectionViewCell.nib, forCellWithReuseIdentifier: "Cell")

        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let screenWidth = UIScreen.main.bounds.width
        
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 2
        layout.sectionInset.top = 1
        layout.sectionInset.bottom = 1
        
        let itemWidth: CGFloat = (screenWidth / 3.0).rounded(.down)
        let itemSize = CGSize(width: itemWidth - 1.0 , height: (itemWidth * 3) / 2)
        layout.itemSize = itemSize
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MovieCollectionViewCell
        let movie = movies[indexPath.row]
        cell.movie = movie
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.item]
        delegate?.movieListViewController(self, didSelect: movie)
    }
    
}

