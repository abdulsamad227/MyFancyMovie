//
//  Transform.swift
//  MyFancyMoive
//
//  Created by Abdulsamad on 07/04/2022.
//

import Foundation
import UIKit

struct Transform {
    let pathFinder = URLPathFinder()
    func movieDataToMovieModel(from movieDatas: MovieData) -> [MovieModel]{
        movieDatas.results.map { movieData in
            let movieName = movieData.original_title
            let description = movieData.overview
            let backImage = movieData.backdrop_path
            let posterImage = movieData.poster_path
            let rating = movieData.vote_average
            let movieModel = MovieModel(movieName: movieName, movieDescription: description, backgroundPath: backImage, posterPath: posterImage, rating: rating, medalImage: UIImage())
            return movieModel
        }
    }
    
   
}

