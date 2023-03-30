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
    
    func checkIfThereIsRectangle(at point: Point) -> (isRectangleLocated: Bool, rectanglesOnPoint: Rectangle?) {
        //TODO: 작성예정
//        var rectanglesOnPoint: [Rectangle] = []
//
//        for component in components {
//            
//        }
        return (false, nil)
        
        func doesRectangleIncludesThePoint() {
            
        }
    }
}
