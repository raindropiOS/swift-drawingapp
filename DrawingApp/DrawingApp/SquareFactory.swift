//
//  SquareFactory.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/27.
//

import Foundation

class SquareFactory {
    static func makeSquare(x: Double, y: Double, width: Double, height: Double, kind: SquareKind) -> Square? {
        switch kind {
        case .random:
            return returnRandomSquare(x: x, y: y, width: width, height: height)
        }
    }
    
    static func returnRandomSquare(x: Double, y: Double, width: Double, height: Double) -> RandomSquare {
        let id: String = IdGenerator.generateId(length: 9, separateAt: 4)
        let r = CGFloat.random(in: 0...255)
        let g = CGFloat.random(in: 0...255)
        let b = CGFloat.random(in: 0...255)
        let alpha = CGFloat.random(in: 1...10)
        
        return RandomSquare(id: id, x: x, y: y, width: width, height: height, bgColor: (r, g, b), alpha: alpha)
    }
}

enum SquareKind {
    case random
}

protocol Square {
    var x: Double { get }
    var y: Double { get }
    var width: Double { get }
    var height: Double { get }
}
