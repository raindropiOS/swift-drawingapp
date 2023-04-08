//
//  ColorFactory.swift
//  DrawingApp
//
//  Created by 에디 on 2023/04/08.
//

import Foundation

class ColorFactory: ColorAlphaProducible {
    func makeColor(r: Float, g: Float, b: Float) -> Color {
        Color(r: r, g: g, b: b)
    }
    
    func makeRandomColor() -> Color {
        let r = Float.random(in: 0...255)/255
        let g = Float.random(in: 0...255)/255
        let b = Float.random(in: 0...255)/255
        
        return Color(r: r, g: g, b: b)
    }
    
    func makeRandomAlpha() -> Alpha {
        Alpha.allCases.randomElement() ?? .ten
    }
    
}
