//
//  MyFancyMovieTests.swift
//  MyFancyMovieTests
//
//  Created by Abdulsamad on 11/04/2022.
//

import XCTest
@testable import MyFancyMovie

class MyFancyMovieTests: XCTestCase {

    // testing MovieFacade class
    func testGetMedalImage() {
        let movieFacade = MovieFacade()
        var image: UIImage
        
        image = movieFacade.getMedalImage(rating: 0.0)
        XCTAssertEqual(image, UIImage(named: "bronze"))
        image = movieFacade.getMedalImage(rating: 3.9)
        XCTAssertEqual(image, UIImage(named: "bronze"))
        
        image = movieFacade.getMedalImage(rating: 4.0)
        XCTAssertEqual(image, UIImage(named: "silver"))
        image = movieFacade.getMedalImage(rating: 6.9)
        XCTAssertEqual(image, UIImage(named: "silver"))
        
        image = movieFacade.getMedalImage(rating: 7.0)
        XCTAssertEqual(image, UIImage(named: "gold"))
        image = movieFacade.getMedalImage(rating: 10.0)
        XCTAssertEqual(image, UIImage(named: "gold"))
    }
    
    
    // testing MovieDetailViewFactory class
    func testGetDetailView() {
        let movieDetailViewFactroy = MovieDetailViewFactory()
        var detailView:MovieDetailView
        var image: UIImage?
        
        detailView = movieDetailViewFactroy.getDetailView(based: .Low)
        image = detailView.imageView.image
        XCTAssertEqual(image, UIImage(named: "bronze"))
        
        detailView = movieDetailViewFactroy.getDetailView(based: .Medium)
        image = detailView.imageView.image
        XCTAssertEqual(image, UIImage(named: "silver"))
        
        detailView = movieDetailViewFactroy.getDetailView(based: .High)
        image = detailView.imageView.image
        XCTAssertEqual(image, UIImage(named: "gold"))
    }
    
    
    // testing URLPathFinder class
    func testGetPathForMovieEndPoint() {
        let pathFinder = URLPathFinder()
        var url: URL?
        
        url = pathFinder.getPathForMovieEndPoint(with: "popular", page: 1)
        XCTAssertEqual(url!.absoluteString, "https://api.themoviedb.org/3/movie/popular?api_key=a99ea6092977260d127bc2afb4443678&language=en-US&page=1")
        //
        url = pathFinder.getPathForMovieEndPoint(with: "top_rated", page: 2)
        XCTAssertEqual(url!.absoluteString, "https://api.themoviedb.org/3/movie/top_rated?api_key=a99ea6092977260d127bc2afb4443678&language=en-US&page=2")
    }
    
    func testGetPathForImageEndPoint() {
        let pathFinder = URLPathFinder()
        var url: URL?
        
        url = pathFinder.getPathForImageEndPoint(with: "/egoyMDLqCxzjnSrWOz50uLlJWmD.jpg", imageSize: .UltraLow)
        XCTAssertEqual(url!.absoluteString, "https://image.tmdb.org/t/p/w45/egoyMDLqCxzjnSrWOz50uLlJWmD.jpg")
        //
        url = pathFinder.getPathForImageEndPoint(with: "/fOy2Jurz9k6RnJnMUMRDAgBwru2.jpg", imageSize: .Low)
        XCTAssertEqual(url!.absoluteString, "https://image.tmdb.org/t/p/w154/fOy2Jurz9k6RnJnMUMRDAgBwru2.jpg")
        //
        url = pathFinder.getPathForImageEndPoint(with: "/fOy2Jurz9k6RnJnMUMRDAgBwru2.jpg", imageSize: .Medium)
        XCTAssertEqual(url!.absoluteString, "https://image.tmdb.org/t/p/w300/fOy2Jurz9k6RnJnMUMRDAgBwru2.jpg")
        //
        url = pathFinder.getPathForImageEndPoint(with: "/fOy2Jurz9k6RnJnMUMRDAgBwru2.jpg", imageSize: .High)
        XCTAssertEqual(url!.absoluteString, "https://image.tmdb.org/t/p/w500/fOy2Jurz9k6RnJnMUMRDAgBwru2.jpg")
        //
        url = pathFinder.getPathForImageEndPoint(with: "/fOy2Jurz9k6RnJnMUMRDAgBwru2.jpg", imageSize: .UltraHigh)
        XCTAssertEqual(url!.absoluteString, "https://image.tmdb.org/t/p/original/fOy2Jurz9k6RnJnMUMRDAgBwru2.jpg")
    }

}
