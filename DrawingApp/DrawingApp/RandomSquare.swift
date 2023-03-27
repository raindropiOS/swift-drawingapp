//
//  RandomSquare.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/27.
//

import Foundation

class RandomSquare {
    let id: String
    let location: (Double, Double)
    let size: (Double, Double)
    let bgColor: (CGFloat, CGFloat, CGFloat)
    let alpha: CGFloat
    
    init(id: String, location: (Double, Double), size: (Double, Double), bgColor: (CGFloat, CGFloat, CGFloat), alpha: CGFloat) {
        self.id = id
        self.location = location
        self.size = size
        self.bgColor = bgColor
        self.alpha = alpha
    }
}

extension RandomSquare: CustomStringConvertible {
    var description: String {
        "id : \(id) location : \(location) size : \(size)"
    }
}
