//
//  ViewController.swift
//  MyFancyMoive
//
//  Created by Abdulsamad on 06/04/2022.
//

import UIKit
import RxSwift
import RxCocoa
class HomeViewController: UIViewController, Storyboarded, Coordinating {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    var coordiantor: Coordinator?
    var homeViewModel: HomeViewModelType?
    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadingIndicator.rx.is
        movieCollectionView.delegate = self
        registerCell()
        bindInputs(with: homeViewModel!.inputs)
        bindOutputs(with: homeViewModel!.outputs)
        
    }

    func bindInputs(with input: HomeViewModelInputs) {
        movieCollectionView.rx.itemSelected.subscribe(onNext: {index in input.itemSelected(index: index, coordinator: self.coordiantor!)}).disposed(by: bag)
        
    }
    
    func bindOutputs(with output: HomeViewModelOutputs) {
        output.imageItems.drive(movieCollectionView.rx.items(cellIdentifier: MovieCustomCollectionViewCell().cellId, cellType: MovieCustomCollectionViewCell.self)){
            index,movieModel,cell in
            cell.movieImageView.image = movieModel
        }.disposed(by: bag)
        output.isIndicatorAnimating.drive(loadingIndicator.rx.isAnimating).disposed(by: bag)
        output.isIndicatorHidden.drive(loadingIndicator.rx.isHidden).disposed(by: bag)
    }
    
    func registerCell() {
        let cell = MovieCustomCollectionViewCell()
        movieCollectionView.register(cell.nib(), forCellWithReuseIdentifier: cell.cellId)
    }
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = UIScreen.main.bounds.size.width / 5
        return CGSize(width: itemSize, height: itemSize)
    }
    
    
}

