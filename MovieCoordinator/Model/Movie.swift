//
//  Movie.swift
//  MovieCoordinator
//
//  Created by Alfian Losari on 16/05/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import Foundation

public struct Movie: Codable {
    
    public let id: Int
    public let title: String
    public let posterPath: String
    public let overview: String
    public let releaseDate: Date
    public let voteAverage: Double
    public let voteCount: Int
    
    public var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")!
    }
    
    public var voteAveragePercentText: String {
        return "\(Int(voteAverage * 10))%"
    }
}

extension Movie {
    
    private static var jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    public static var dummyMovies: [Movie] {
        let url = Bundle.main.url(forResource: "movie", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let movies = try! jsonDecoder.decode([Movie].self, from: data)
        
        return movies    
    }
    
}
