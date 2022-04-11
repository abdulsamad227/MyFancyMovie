//
//  Movie.swift
//  MyFancyMoive
//
//  Created by Abdulsamad on 07/04/2022.
//

import Foundation

struct MovieData: Codable {
    let results: [Result]
    
}


struct Result: Codable {
    let original_title: String
    let overview: String
    let backdrop_path: String
    let poster_path: String
    let vote_average: Float
}
