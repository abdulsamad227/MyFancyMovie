//
//  ApiEndPointUnitTests.swift
//  MyFancyMovieTests
//
//  Created by Abdulsamad on 11/04/2022.
//

import XCTest
@testable import MyFancyMovie
class ApiEndPointUnitTests: XCTestCase {

    func test_GetPopularMovies_Returns_ListOfMovie() {
        let apiEndPoint = ApiEndPoint()
        let expectation = self.expectation(description: "Returns_ListOfMovie")
        apiEndPoint.getPopularMovies { error, movies in
            XCTAssertNotNil(movies)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
