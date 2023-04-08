//
//  RandomSquare.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/27.
//

import Foundation

class Rectangle: Shape {
    let id: Id
    let origin: Point
    let size: Size
    private(set) var backgroundColor: Color
    private(set) var alpha: Alpha
    
    init(id: Id, origin: Point, size: Size, bgColor: Color, alpha: Alpha) {
        self.id = id
        self.origin = origin
        self.size = size
        self.backgroundColor = bgColor
        self.alpha = alpha
    }
    
    func setBackgroundColorWith(_ color: Color) {
        self.backgroundColor = color
    }
    
    func setAlphaWith(_ alpha: Alpha) {
        self.alpha = alpha
    }
}

extension Rectangle: CustomStringConvertible {
    var description: String {
        "(\(id.value)), X:\(origin.x), Y:\(origin.y), W\(size.width), H\(size.height), R:\(backgroundColor.r), G:\(backgroundColor.g), B:\(backgroundColor.b)"
    }
}
