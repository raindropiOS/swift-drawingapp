//
//  ColorGeneratable.swift
//  DrawingApp
//
//  Created by 에디 on 2023/04/08.
//

import Foundation

protocol ColorAlphaProducible {
    func makeColor(r: Float, g: Float, b: Float) -> Color
    func makeRandomColor() -> Color
    func makeRandomAlpha() -> Alpha
}
