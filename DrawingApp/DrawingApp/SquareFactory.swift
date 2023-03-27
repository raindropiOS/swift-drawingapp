//
//  SquareFactory.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/27.
//

import Foundation

class SquareFactory {
    static func makeSquare(kind: SquareKind) -> Square? {
        switch kind {
//        case .random:
        default:
            return nil
        }
    }
    
//    func returnRandomSquare() -> RandomSquare {
//
//    }
}

enum SquareKind {
    case random
}

protocol Square {
    var pointX: Double { get }
    var pointY: Double { get }
    var width: Double { get }
    var height: Double { get }
}


// 부수적인 메소드
extension SquareFactory {
    
}
