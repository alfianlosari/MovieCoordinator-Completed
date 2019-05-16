//
//  MovieDetailViewController.swift
//  MovieCoordinator
//
//  Created by Alfian Losari on 16/05/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import UIKit

class MovieDetailViewController: UITableViewController {
    
    var movie: Movie? {
        didSet {
            title = movie?.title
            tableView.reloadData()
        }
    }
    
    init() {
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        navigationController?.navigationBar.prefersLargeTitles = false
        
        tableView.tableFooterView = UIView()
        tableView.register(MovieBackdropTableViewCell.nib, forCellReuseIdentifier: "BackdropCell")
        tableView.register(MovieDetailTableViewCell.nib, forCellReuseIdentifier: "DetailCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.row) {
        case (0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "BackdropCell", for: indexPath) as! MovieBackdropTableViewCell
            cell.imageURL = movie?.posterURL
            return cell
            
        case (1):
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! MovieDetailTableViewCell
            cell.movie = movie
            return cell
            
        default:
            fatalError()
        }
        
    }
    
}
