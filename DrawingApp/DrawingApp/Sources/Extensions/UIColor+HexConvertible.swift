//
//  CGColor+returnHexString.swift
//  DrawingApp
//
//  Created by 에디 on 2023/04/05.
//

import UIKit

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }

    var returnHex: String {
        let rgba = self.rgba
        
        return "#\(String(Int(rgba.red * 255), radix: 16))\(String(Int(rgba.green * 255), radix: 16))\(String(Int(rgba.blue * 255), radix: 16))"
    }

    convenience init(hex: String, alpha: Alpha) {
        // #FFFFFF 와 같은 형태를 받는다고 가정
        let strArr = Array(hex)
        let r: Int = Int(String(strArr[1...2]), radix: 16) ?? 0
        let g: Int = Int(String(strArr[3...4]), radix: 16) ?? 0
        let b: Int = Int(String(strArr[5...6]), radix: 16) ?? 0
        let alpha: CGFloat = CGFloat(alpha.rawValue)

        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }
}
