//
//  IdGenerator.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/27.
//

import Foundation

class IdGenerator {
    static func generateId(length: Int, separateAt: Int) -> String {
        guard length > 0 else { return "" }
        var isRemainderZero: Bool {
            length % separateAt == 0
        }
        var totalLength: Int
        let alphabetAndNumber = "abcdefghijklmnopqrstuvwxyz0123456789"
        var generatedId: String = ""
        
        totalLength = length
        totalLength += isRemainderZero ? length / separateAt - 1 : length / separateAt
        for i in 1...totalLength {
            if i % separateAt == 0 { generatedId.append("-"); continue }
            generatedId += String(alphabetAndNumber.randomElement() ?? "!")
        }
        
        return generatedId
    }
}
