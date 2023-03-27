//
//  RandomSquare.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/27.
//

import Foundation

class RandomSquare {
    let id: String
    let pointX: Double
    let pointY: Double
    let width: Double
    let height: Double
    let bgColor: (CGFloat, CGFloat, CGFloat)
    let alpha: CGFloat
    
    init(id: String, pointX: Double, pointY: Double, width: Double, height: Double, bgColor: (CGFloat, CGFloat, CGFloat), alpha: CGFloat) {
        self.id = id
        self.pointX = pointX
        self.pointY = pointY
        self.width = width
        self.height = height
        self.bgColor = bgColor
        self.alpha = alpha
    }
}

extension RandomSquare: CustomStringConvertible {
    var description: String {
        "(\(id)), X:\(pointX), Y:\(pointY), W\(width), H\(height), R:\(bgColor.0), G:\(bgColor.1), B:\(bgColor.2)"
    }
}
