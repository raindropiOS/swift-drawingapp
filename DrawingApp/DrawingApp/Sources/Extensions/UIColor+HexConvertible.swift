//
//  CGColor+returnHexString.swift
//  DrawingApp
//
//  Created by 에디 on 2023/04/05.
//

import UIKit


extension UIColor {
    // https://stackoverflow.com/questions/49150872/how-to-convert-rgb-values-to-hex-string-ios-swift
    func toHexString() -> String {
            var r:CGFloat = 0
            var g:CGFloat = 0
            var b:CGFloat = 0
            var a:CGFloat = 0

            getRed(&r, green: &g, blue: &b, alpha: &a)

            let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

            return NSString(format:"#%06x", rgb) as String
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
