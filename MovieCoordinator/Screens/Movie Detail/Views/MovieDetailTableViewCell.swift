//
//  MovieDetailTableViewCell.swift
//  MovieKit
//
//  Created by Alfian Losari on 11/25/18.
//  Copyright © 2018 Alfian Losari. All rights reserved.
//

import UIKit

public class MovieDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!

    public static var nib: UINib {
        return UINib(nibName: "MovieDetailTableViewCell", bundle: Bundle(for: MovieDetailTableViewCell.self))
    }
    
    public static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter
    }()
    
    public var movie: Movie? {
        didSet {
            guard let movie = movie else {
                return
            }
            
            overviewLabel.text = movie.overview
            yearLabel.text = MovieDetailTableViewCell.dateFormatter.string(from: movie.releaseDate)
            if movie.voteCount == 0 {
                ratingLabel.isHidden = true
            } else {
                ratingLabel.isHidden = false
                ratingLabel.text = movie.voteAveragePercentText
            }
        }
    }
  
}
