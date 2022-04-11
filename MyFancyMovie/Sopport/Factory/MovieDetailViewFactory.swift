//
//  Factory.swift
//  MyFancyMoive
//
//  Created by Abdulsamad on 10/04/2022.
//

import UIKit

enum DetailViewRating {
    case Low
    case Medium
    case High
}

protocol MovieDetailView {
    var imageView: UIImageView { get }
}

class MovieDetailViewFactory {
    func getDetailView(based rating: DetailViewRating) -> MovieDetailView {
        switch rating {
        case .Low:
            return BronzeDetailView()
        case .Medium:
            return SilverDetailView()
        case .High:
            return GoldenDetailView()
        
        }
    }
}

class BronzeDetailView: MovieDetailView {
    var imageView: UIImageView
    private let imageName = "bronze"
    
    init() {
        imageView = UIImageView(image: UIImage(named: imageName))
    }
}



class SilverDetailView: MovieDetailView {
    var imageView: UIImageView
    private let imageName = "silver"
    
    init() {
        imageView = UIImageView(image: UIImage(named: imageName))
    }
}

class GoldenDetailView: MovieDetailView {
    var imageView: UIImageView
    private let imageName = "gold"
    
    init() {
        imageView = UIImageView(image: UIImage(named: imageName))
    }
}



//
//
//
//
//
//enum ProfileType {
//    case normal
//    case privilege
//}
//
//protocol ProfileView {
//    var profileImage: UIImageView {get set}
//    var profileDecor: UIView {get set}
//    var profileAge: Int {get set}
//    var profileName: String {get set}
//}
//
//class ProfileViewFacotry {
//    static func getProfileView(type: ProfileType) -> ProfileView {
//        switch type {
//        case .normal:
//            return NormalProfileView()
//        case .privilege:
//            return PrivilegeProfileView()
//        }
//    }
//}
//
//class NormalProfileView: ProfileView {
//    var profileImage: UIImageView = UIImageView()
//    var profileDecor: UIView = UIView()
//    var profileAge: Int = 0
//    var profileName: String = ""
//
//    init() {
//        profileDecor.backgroundColor = .red
//    }
//}
//
//class PrivilegeProfileView: ProfileView {
//    var profileImage: UIImageView = UIImageView()
//    var profileDecor: UIView = UIView()
//    var profileAge: Int = 0
//    var profileName: String = ""
//
//    init() {
//        profileDecor.backgroundColor = .green
//    }
//}
