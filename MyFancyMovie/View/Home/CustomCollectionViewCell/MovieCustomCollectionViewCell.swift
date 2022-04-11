//
//  MovieCustomCellCollectionViewCell.swift
//  MyFancyMoive
//
//  Created by Abdulsamad on 06/04/2022.
//

import UIKit

class MovieCustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    let cellId = "MovieCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    func nib() -> UINib {
        return UINib(nibName: "MovieCustomCollectionViewCell", bundle: nil)
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        print("prepare for reuse ")
//        movieImageView.image = nil
//    }
}
