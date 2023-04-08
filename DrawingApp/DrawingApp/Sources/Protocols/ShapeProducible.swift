//
//  ShapeProducible.swift
//  DrawingApp
//
//  Created by 에디 on 2023/04/09.
//

import Foundation

protocol ShapeProducible {
    func makeShape(point: Point, size: Size, kind: ShapeKind) -> Shape?
    func returnRandomSquare(point: Point, size: Size) -> Rectangle?
}
