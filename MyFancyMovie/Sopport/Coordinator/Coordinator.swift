//
//  Cordinator.swift
//  MyFancyMoive
//
//  Created by Abdulsamad on 06/04/2022.
//

import Foundation
import UIKit

protocol Coordinating {
    var coordiantor: Coordinator? { get set }
}

protocol Coordinator {
    var navigationController: UINavigationController? { set get }
    
    func start()
    func detail(movie: MovieModel)
}

