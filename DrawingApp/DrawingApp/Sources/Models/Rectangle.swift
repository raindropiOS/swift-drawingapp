//
//  RandomSquare.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/27.
//

import Foundation

class Rectangle: Shape {
    let id: Id
    let point: Point
    let size: Size
    let backgroundColor: Color
    let alpha: Int
    
    init(id: Id, point: Point, size: Size, bgColor: Color, alpha: Int) {
        self.id = id
        self.point = point
        self.size = size
        self.backgroundColor = bgColor
        self.alpha = alpha
    }
}

extension Rectangle: CustomStringConvertible {
    var description: String {
        "(\(id.value)), X:\(point.x), Y:\(point.y), W\(size.width), H\(size.height), R:\(backgroundColor.r), G:\(backgroundColor.g), B:\(backgroundColor.b)"
    }
}
