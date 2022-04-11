//
//  URLPathFinder.swift
//  MyFancyMoive
//
//  Created by Abdulsamad on 10/04/2022.
//

import Foundation

enum ImageSize {
    case UltraLow
    case Low
    case Medium
    case High
    case UltraHigh
}


class URLPathFinder {
    private let movieBaseURL = "https://api.themoviedb.org/3/movie/"
    private let imageBaseURL = "https://image.tmdb.org/t/p/"
    private let apiKey = "a99ea6092977260d127bc2afb4443678"
    
    func getPathForMovieEndPoint(with movieCategory: String, page: Int) -> URL? {
        let url = URL(string: "\(movieBaseURL)\(movieCategory)?api_key=\(apiKey)&language=en-US&page=\(page)")
        return url
    }
    
    func getPathForImageEndPoint(with imagePath: String, imageSize: ImageSize) -> URL? {
        let size = getImageSize(for: imageSize)
        return URL(string: "\(imageBaseURL)\(size)\(imagePath)")
    }
    
    
    private func getImageSize(for size: ImageSize) -> String{
        switch size {
        case .UltraLow:
            return "w45"
        case .Low:
            return "w154"
        case .Medium:
            return "w300"
        case .High:
            return "w500"
        case .UltraHigh:
            return "original"
        }
   
    }
}
