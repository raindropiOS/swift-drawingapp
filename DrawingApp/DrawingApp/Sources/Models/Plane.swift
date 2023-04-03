//
//  Plane.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/29.
//

import Foundation

struct Plane {
    private var components: [Shape] = []
    var count: Int {
        components.count
    }
    
    mutating func addShape(_ shape: Shape) {
        components.append(shape)
    }
    
    func returnComponent(at index: Int) -> Shape? {
        components[index]
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
        let xBoundary = shape.point.x...shape.point.x + shape.size.width
        let yBoundary = shape.point.y...shape.point.y + shape.size.height
        
        return xBoundary.contains(point.x) && yBoundary.contains(point.y)
    }
}
