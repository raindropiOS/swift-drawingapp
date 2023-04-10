//
//  Plane.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/29.
//

import Foundation
import OSLog

struct Plane: PlaneLike {
    private var components: [Shape] = []
    let logger = Logger()
    var count: Int {
        components.count
    }
    
    subscript(index: Int) -> Shape? {
        components[index]
    }
    
    mutating func addShape(_ shape: Shape) {
        components.append(shape)
    }
    
    func returnComponent(id: Id) -> Shape? {
        components.first { shape in
            shape.id.value == id.value
        }
    }
    
    func setComponentColorWith(_ color: Color, id: Id) {
        guard let component = returnComponent(id: id) else {logger.log("[Plane.setComponentColorWith] components에서 일치하는 id 없음"); return}
        component.setBackgroundColorWith(color)
        
    }
    
    func setComponentAlphaWith(_ alpha: Alpha, id: Id) {
        guard let component = returnComponent(id: id) else {logger.log("[Plane.setComponentAlphaWith] components에서 일치하는 id 없음"); return}
        component.setAlphaWith(alpha)
    }
    
    func returnForefrontShape(at point: Point) -> Shape? {
        var foreFrontShapeWhichIncludesPoint: Shape? = nil
            
        for component in components {
            if doesShapeIncludes(point: point, shape: component) {
                foreFrontShapeWhichIncludesPoint = component
            }
        }
        
        return foreFrontShapeWhichIncludesPoint
    }
    
    private func doesShapeIncludes(point: Point, shape: Shape) -> Bool {
        let xBoundary = shape.origin.x...shape.origin.x + shape.size.width
        let yBoundary = shape.origin.y...shape.origin.y + shape.size.height
        
        return xBoundary.contains(point.x) && yBoundary.contains(point.y)
    }
}
