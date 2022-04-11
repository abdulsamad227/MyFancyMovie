//
//  DetailViewModel.swift
//  MyFancyMoive
//
//  Created by Abdulsamad on 09/04/2022.
//

import Foundation
import RxSwift
import RxCocoa
protocol DetailViewModelInputs {
    
}

protocol DetailViewModelOutputs {
    var movieImageDriver: Driver<UIImage> { get }
    var movieMedalDriver: Driver<UIImage> { get }
    var movieNameDriver: Driver<String> { get }
    var ratingDriver: Driver<String> { get }
    var movieDescreptionDriver: Driver<String> { get }
}

protocol DetailViewModelType: DetailViewModelInputs, DetailViewModelOutputs {
    var inputs: DetailViewModelInputs { get }
    var outputs: DetailViewModelOutputs { get }
}



class DetailViewModel: DetailViewModelType {
    var inputs: DetailViewModelInputs { self }
    var outputs: DetailViewModelOutputs { self }
    
    var movieImageDriver: Driver<UIImage>
    var movieMedalDriver: Driver<UIImage>
    var movieNameDriver: Driver<String>
    var ratingDriver: Driver<String>
    var movieDescreptionDriver: Driver<String>
    
    let bag = DisposeBag()
    private var observableMovie: Observable<MovieModel>
    
    
    
    init(movie: MovieModel) {
        let facade = MovieFacade()
        observableMovie = Observable.just(movie)
        movieImageDriver = observableMovie.map({ movie in
            facade.getSingleBackgroundImage(from: movie)
        }).asDriver(onErrorJustReturn: UIImage())
        movieMedalDriver = observableMovie.map({ movie in
            facade.getMedalImage(rating: movie.rating)
        }).asDriver(onErrorJustReturn: UIImage())
        movieNameDriver = observableMovie.map { movie in
            movie.movieName
        }.asDriver(onErrorJustReturn: "")
        ratingDriver = observableMovie.map { movie in
            String("\(movie.rating)")
        }.asDriver(onErrorJustReturn: "")
        movieDescreptionDriver = observableMovie.map({ movie in
            movie.movieDescription
        }).asDriver(onErrorJustReturn: "")
    }
}
