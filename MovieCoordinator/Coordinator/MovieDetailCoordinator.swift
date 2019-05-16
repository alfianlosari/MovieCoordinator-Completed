//
//  MovieDetailCoordinator.swift
//  MovieCoordinator
//
//  Created by Alfian Losari on 16/05/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

class MovieDetailCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var movieDetailViewController: MovieDetailViewController?
    private let movie: Movie
    
    
    init(presenter: UINavigationController, movie: Movie) {
        self.presenter = presenter
        self.movie = movie
    }
    
    
    func start() {
        let movieDetailViewController = MovieDetailViewController()
        movieDetailViewController.movie = movie
        self.movieDetailViewController = movieDetailViewController
        
        presenter.pushViewController(movieDetailViewController, animated: true)
        
    }
}
