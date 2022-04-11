//
//  PopularMovie.swift
//  MyFancyMoive
//
//  Created by Abdulsamad on 07/04/2022.
//

import UIKit

class ApiEndPoint {
    let pathFinder = URLPathFinder()
    func getPopularMovies(result: @escaping (Error?,[MovieModel]?) -> ()){
        let path = pathFinder.getPathForMovieEndPoint(with: "popular", page: 1)
        performRequest(with: path, completion: result)
    }
    
    private func performRequest(with url: URL?, completion: @escaping (Error?, [MovieModel]?) -> ()){
        print("request performed" )
        let utils = Utils()
        guard let url = url else {
            completion(CustomError(title: "Path Error", description: "Path Not Found", code: 1), nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(error, nil)
                return
            }
            guard let safeData = data else { return }
            guard let listOfMovies = utils.parseJson(with: safeData) else { return }
            completion(nil, listOfMovies)
            print("data receveid")
        }.resume()
    }
    
  
}


class Utils {
    func parseJson(with data: Data) -> [MovieModel]? {
        let jsonDecoder = JSONDecoder()
        do {
            let transform = Transform()
            let decodedData = try jsonDecoder.decode(MovieData.self, from: data)
            let listOfMovies = transform.movieDataToMovieModel(from: decodedData)
            return listOfMovies
        } catch {
            return nil
        }
    }
}
