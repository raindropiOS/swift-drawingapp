//
//  RandomSquare.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/27.
//

import Foundation

class RandomSquare: Square {
    let id: Id
    let point: Point
    let size: Size
    let bgColor: (CGFloat, CGFloat, CGFloat)
    let alpha: CGFloat
    
    init(id: Id, point: Point, size: Size, bgColor: (CGFloat, CGFloat, CGFloat), alpha: CGFloat) {
        self.id = id
        self.point = point
        self.size = size
        self.bgColor = bgColor
        self.alpha = alpha
    }
}

extension RandomSquare: CustomStringConvertible {
    var description: String {
        "(\(id.value)), X:\(point.x), Y:\(point.y), W\(size.width), H\(size.height), R:\(bgColor.0), G:\(bgColor.1), B:\(bgColor.2)"
    }
}
