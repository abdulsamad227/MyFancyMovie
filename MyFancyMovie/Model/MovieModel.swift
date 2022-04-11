//
//  MovieModel.swift
//  MyFancyMoive
//
//  Created by Abdulsamad on 07/04/2022.
//

import Foundation
import UIKit

struct MovieModel {
    var movieName: String
    var movieDescription: String
    var backgroundPath: String
    var posterPath: String
    var rating: Float
    var medalImage: UIImage
    
    init() {
        movieName = ""
        movieDescription = ""
        backgroundPath = ""
        posterPath = ""
        rating = 0.0
        medalImage = UIImage()
    }
    
    init(movieName: String, movieDescription: String, backgroundPath: String, posterPath: String, rating: Float, medalImage: UIImage) {
        self.movieName = movieName
        self.movieDescription = movieDescription
        self.backgroundPath = backgroundPath
        self.posterPath = posterPath
        self.rating = rating
        self.medalImage = medalImage
    }
}
