//
//  DetailViewController.swift
//  MyFancyMoive
//
//  Created by Abdulsamad on 06/04/2022.
//

import UIKit
import RxSwift

class DetailViewController: UIViewController,Storyboarded,Coordinating {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var moiveRatingLabel: UILabel!
    @IBOutlet weak var movieDicreptionTextView: UITextView!
    @IBOutlet weak var medalImageView: UIImageView!
    
    var coordiantor: Coordinator?
    var detailViewModel: DetailViewModelType?
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindOutputs(with: detailViewModel!.outputs)
    }
    
    func bindOutputs(with outputs: DetailViewModelOutputs) {
        outputs.movieImageDriver.drive(movieImageView.rx.image).disposed(by: bag)
        outputs.movieMedalDriver.drive(medalImageView.rx.image).disposed(by: bag)
        outputs.movieNameDriver.drive(movieNameLabel.rx.text).disposed(by: bag)
        outputs.ratingDriver.drive(moiveRatingLabel.rx.text).disposed(by: bag)
        outputs.movieDescreptionDriver.drive(movieDicreptionTextView.rx.text).disposed(by: bag)
    }
}
