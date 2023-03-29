//
//  SquareFactory.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/27.
//

import Foundation

class ShapeFactory {
    static func makeShape(point: Point, size: Size, kind: SquareKind) -> Shape? {
        switch kind {
        case .random:
            return returnRandomSquare(point: point, size: size)
        }
    }
    
    static func returnRandomSquare(point: Point, size: Size) -> Rectangle? {
        guard let id = IdGenerator.generateId(length: 9, separateAt: 4) else { return nil }
        let r = CGFloat.random(in: 0...255)
        let g = CGFloat.random(in: 0...255)
        let b = CGFloat.random(in: 0...255)
        let alpha = CGFloat.random(in: 1...10)
        
        return Rectangle(id: id, point: point, size: size, bgColor: (r, g, b), alpha: alpha)
    }
}

enum SquareKind {
    case random
}

protocol Shape {
    var point: Point { get }
    var size: Size { get }
}
