//
//  Facade.swift
//  MyFancyMoive
//
//  Created by Abdulsamad on 10/04/2022.
//

import UIKit

class MovieFacade {
    private let pathFinder = URLPathFinder()
    private let movieFactory = MovieDetailViewFactory()
    private var listOfImages: [UIImage] = []
    private var image = UIImage()
    private var data = Data()
    
    func getListOfBackgroundImages(from listOfMovie: [MovieModel]) -> [UIImage] {
        listOfImages = []
        for movie in listOfMovie {
            guard let url = pathFinder.getPathForImageEndPoint(with: movie.backgroundPath, imageSize: .Medium) else { return [] }
            do {
                data = try Data(contentsOf:  url)
                image = UIImage(data: data) ?? UIImage()
                listOfImages.append(image)
            } catch {
                print("error getting image for \(movie.backgroundPath)")
            }
            
        }
        return listOfImages
    }
    
    func getSingleBackgroundImage(from movie: MovieModel) -> UIImage {
        if let url = pathFinder.getPathForImageEndPoint(with: movie.backgroundPath, imageSize: .High) {
            do {
                data = try Data(contentsOf: url)
                image = UIImage(data: data) ?? UIImage()
                return image
            } catch {
                print("Error \(error)")
            }
        }
        return UIImage()
    }
    
    func getMedalImage(rating: Float) -> UIImage {
        var detailViewRating = DetailViewRating.Low
        switch rating {
            case 0.0 ..< 4.0:
                detailViewRating = .Low
            case 4.0 ..< 7.0:
                detailViewRating = .Medium
            case 7.0 ... 10.0:
                detailViewRating = .High
            default:
                print("error")
        }
        let detailView = movieFactory.getDetailView(based: detailViewRating)
        image = detailView.imageView.image ?? UIImage()
        return image
    }
    
}
