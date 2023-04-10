//
//  ShapeProducible.swift
//  DrawingApp
//
//  Created by 에디 on 2023/04/09.
//

import Foundation

protocol ShapeProducible {
    func makeShape(origin: Point, size: Size, kind: ShapeKind) -> Shape?
    func returnRandomSquare(origin: Point, size: Size) -> Rectangle?
    func makeRandomSqure(sizeOfView: Point, rectangleSize: Size) -> Shape?
}
