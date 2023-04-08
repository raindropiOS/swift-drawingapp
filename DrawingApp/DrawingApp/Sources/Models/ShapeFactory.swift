//
//  SquareFactory.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/27.
//

import Foundation

class ShapeFactory: ShapeProducible {
    let colorFactory: ColorAlphaProducible
    
    init() {
        colorFactory = ColorFactory()
    }
    
    func makeShape(origin: Point, size: Size, kind: ShapeKind) -> Shape? {
        switch kind {
        case .randomRectangle:
            return returnRandomSquare(origin: origin, size: size)
        }
    }
    
    func returnRandomSquare(origin: Point, size: Size) -> Rectangle? {
        guard let id = IdGenerator.generateId(length: 9, separateAt: 4) else { return nil }
        let randomColor = colorFactory.makeRandomColor()
        let randomAlpha = colorFactory.makeRandomAlpha()
        
        return Rectangle(id: id, origin: origin, size: size, bgColor: randomColor, alpha: randomAlpha)
    }
}

enum ShapeKind {
    case randomRectangle
}
