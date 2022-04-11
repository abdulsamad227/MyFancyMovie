//
//  Storyboarded.swift
//  MyFancyMoive
//
//  Created by Abdulsamad on 06/04/2022.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self : UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let stroyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = stroyboard.instantiateViewController(withIdentifier: id)
        return vc as! Self
    }
}
