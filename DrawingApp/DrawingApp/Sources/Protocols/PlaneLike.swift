//
//  PlaneLike.swift
//  DrawingApp
//
//  Created by 에디 on 2023/04/11.
//

import Foundation

protocol PlaneLike {
    mutating func addShape(_ shape: Shape)
    func returnComponent(id: Id) -> Shape?
    func setComponentColorWith(_ color: Color, id: Id)
    func setComponentAlphaWith(_ alpha: Alpha, id: Id)
    func returnForefrontShape(at point: Point) -> Shape?
}
