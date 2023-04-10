//
//  IdProducible.swift
//  DrawingApp
//
//  Created by 에디 on 2023/04/11.
//

import Foundation

protocol IdProducible {
    func makeId(length: Int, separateAt: Int) -> Id?
}
