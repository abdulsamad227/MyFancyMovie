//
//  File.swift
//  MyFancyMoive
//
//  Created by Abdulsamad on 06/04/2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeViewModelInputs {
    func itemSelected(index: IndexPath, coordinator: Coordinator)
}
protocol HomeViewModelOutputs {
    var imageItems: Driver<[UIImage]> { get }
    var isIndicatorHidden: Driver<Bool> { get }
    var isIndicatorAnimating: Driver<Bool> { get }
}
protocol HomeViewModelType: HomeViewModelInputs, HomeViewModelOutputs {
    var inputs: HomeViewModelInputs { get }
    var outputs: HomeViewModelOutputs { get }
}


class HomeViewModel: HomeViewModelType {
    var inputs: HomeViewModelInputs { self }
    var outputs: HomeViewModelOutputs { self }
    
    private var loadingIndcatorHiddenness = BehaviorRelay<Bool>(value: false)
    private var loadingIndcatorAnimation = BehaviorRelay<Bool>(value: true)
    var isIndicatorHidden: Driver<Bool> { loadingIndcatorHiddenness.asDriver(onErrorJustReturn: false)}
    var isIndicatorAnimating: Driver<Bool> { loadingIndcatorAnimation.asDriver(onErrorJustReturn: true) }
    
    private let images = BehaviorRelay<[UIImage]>(value: [])
    var imageItems: Driver<[UIImage]> { images.asDriver(onErrorJustReturn: []) }
    
    var movies:[MovieModel] = []
    
    let apiEndpoint = ApiEndPoint()
    let facade = MovieFacade()
    
    init() {
        apiEndpoint.getPopularMovies { error, listOfMovie in
            if let listOfMovie = listOfMovie {
                let listOfImages = self.facade.getListOfBackgroundImages(from: listOfMovie)
                self.images.accept(listOfImages)
                self.movies = listOfMovie
                self.loadingIndcatorHiddenness.accept(true)
                self.loadingIndcatorAnimation.accept(false)
            }
        }
       
    }
    
    func itemSelected(index: IndexPath, coordinator: Coordinator) {
        let movie = movies[index.row]
        coordinator.detail(movie: movie)
    }
}
