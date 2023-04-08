//
//  Color.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/30.
//

import Foundation

struct Color {
    @RangedValue(minimum: 0, maximum: 1.0) var r: Float = 0.5
    @RangedValue(minimum: 0, maximum: 1.0) var g: Float = 0.5
    @RangedValue(minimum: 0, maximum: 1.0) var b: Float = 0.5
}
