//
//  MovieBackdropTableViewCell.swift
//  MovieKit
//
//  Created by Alfian Losari on 11/25/18.
//  Copyright © 2018 Alfian Losari. All rights reserved.
//

import UIKit
import Kingfisher

public class MovieBackdropTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backdropImageView: UIImageView!
    
    public static var nib: UINib {
        return UINib(nibName: "MovieBackdropTableViewCell", bundle: Bundle(for: MovieBackdropTableViewCell.self))
    }
    
    public var imageURL: URL? {
        didSet {
            backdropImageView.kf.setImage(with: imageURL)
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        backdropImageView.kf.indicatorType = .activity

    }
    
}
