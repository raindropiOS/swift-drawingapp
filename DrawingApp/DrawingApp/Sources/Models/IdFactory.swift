//
//  IdGenerator.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/27.
//

import Foundation

class IdFactory: IdProducible {
    // length는 id를 이루는 글자의 수를 의미합니다. separateAt은 몇 번째마다 "-"를 추가해서 나타낼지 표현합니다. generateId(length: 10, seaparateAt: 4)의 결과물은 123-456-789-1과 같습니다.
    func makeId(length: Int, separateAt: Int) -> Id? {
        guard length > 0 else { return nil }
        let isRemainderZero: Bool = length % separateAt == 0
        var totalLength: Int
        let alphabetAndNumber = "abcdefghijklmnopqrstuvwxyz0123456789"
        var generatedIdValue: String = ""
        
        totalLength = length
        totalLength += isRemainderZero ? length / separateAt - 1 : length / separateAt
        for i in 1...totalLength {
            if i % separateAt == 0 { generatedIdValue.append("-"); continue }
            generatedIdValue += String(alphabetAndNumber.randomElement() ?? "!")
        }
        
        return Id(value: generatedIdValue)
    }
}

struct Id {
    let value: String
}
