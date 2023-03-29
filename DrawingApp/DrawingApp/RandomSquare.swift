//
//  RandomSquare.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/27.
//

import Foundation

class RandomSquare: Square {
    let id: Id
    let x: Double
    let y: Double
    let width: Double
    let height: Double
    let bgColor: (CGFloat, CGFloat, CGFloat)
    let alpha: CGFloat
    
    init(id: Id, x: Double, y: Double, width: Double, height: Double, bgColor: (CGFloat, CGFloat, CGFloat), alpha: CGFloat) {
        self.id = id
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.bgColor = bgColor
        self.alpha = alpha
    }
}

extension RandomSquare: CustomStringConvertible {
    var description: String {
        "(\(id.value)), X:\(x), Y:\(y), W\(width), H\(height), R:\(bgColor.0), G:\(bgColor.1), B:\(bgColor.2)"
    }
}
