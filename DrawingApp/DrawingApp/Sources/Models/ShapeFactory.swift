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
    
    func makeShape(point: Point, size: Size, kind: SquareKind) -> Shape? {
        switch kind {
        case .randomRectangle:
            return returnRandomSquare(point: point, size: size)
        }
    }
    
    func returnRandomSquare(point: Point, size: Size) -> Rectangle? {
        guard let id = IdGenerator.generateId(length: 9, separateAt: 4) else { return nil }
        let randomColor = colorFactory.makeRandomColor()
        let randomAlpha = colorFactory.makeRandomAlpha()
        
        return Rectangle(id: id, point: point, size: size, bgColor: randomColor, alpha: randomAlpha)
    }
}

enum SquareKind {
    case randomRectangle
}
