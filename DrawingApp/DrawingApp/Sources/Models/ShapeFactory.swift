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
        case .randomRectangle:
            return returnRandomSquare(point: point, size: size)
        }
    }
    
    static func returnRandomSquare(point: Point, size: Size) -> Rectangle? {
        guard let id = IdGenerator.generateId(length: 9, separateAt: 4) else { return nil }
        let r = Float.random(in: 0...255)/255
        let g = Float.random(in: 0...255)/255
        let b = Float.random(in: 0...255)/255
        let alpha = Alpha.allCases.randomElement() ?? .ten
        
        return Rectangle(id: id, point: point, size: size, bgColor: Color(r: r, g: g, b: b), alpha: alpha)
    }
}

enum SquareKind {
    case randomRectangle
}
