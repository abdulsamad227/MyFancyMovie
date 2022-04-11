//
//  CustomError.swift
//  MyFancyMoive
//
//  Created by Abdulsamad on 09/04/2022.
//

import Foundation

protocol OurErrorProtocol: LocalizedError {

    var title: String? { get }
    var code: Int { get }
}

struct CustomError: OurErrorProtocol {

    var title: String?
    var code: Int
    var errorDescription: String? { return _description }
    var failureReason: String? { return _description }

    private var _description: String

    init(title: String?, description: String, code: Int) {
        self.title = title ?? "Error"
        self._description = description
        self.code = code
    }
}
