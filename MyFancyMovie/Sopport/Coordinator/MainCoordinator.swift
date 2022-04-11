//
//  MainCoordinator.swift
//  MyFancyMoive
//
//  Created by Abdulsamad on 07/04/2022.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeVC = HomeViewController.instantiate()
        homeVC.coordiantor = self
        homeVC.homeViewModel = HomeViewModel()
        navigationController?.isNavigationBarHidden = true
        navigationController?.setViewControllers([homeVC], animated: false)
    }
    
    func detail(movie: MovieModel) {
        let detailVC = DetailViewController.instantiate()
        detailVC.coordiantor = self
        detailVC.detailViewModel = DetailViewModel(movie: movie)
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
