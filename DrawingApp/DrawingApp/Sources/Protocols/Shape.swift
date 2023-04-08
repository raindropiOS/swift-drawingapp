//
//  Shape.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/30.
//

import Foundation

protocol Shape: Colorable, HaveId, CustomStringConvertible {
    var point: Point { get }
    var size: Size { get }
    
    func setBackgroundColorWith(_ color: Color)
    func setAlphaWith(_ alpha: Alpha) 
}
