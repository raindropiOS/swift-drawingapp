//
//  DrawingAppTests.swift
//  DrawingAppTests
//
//  Created by 에디 on 2023/03/27.
//

import XCTest

final class DrawingAppTests: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    func testGenerateRandomId_길이가_음수일때_빈스트링리턴() {
        let newId = IdGenerator.generateId(length: -5, separateAt: 1)
        XCTAssertEqual(newId, "")
    }
    
    func testGenerateRandomId_길이가_0일때_빈스트링리턴() {
        let newId = IdGenerator.generateId(length: 0, separateAt: 3)
        XCTAssertEqual(newId, "")
    }
    
    func testGenerateRandomId_길이가_9이고_4글자위치에서_분리할때_11길이스트링리턴() {
        let newId = IdGenerator.generateId(length: 9, separateAt: 4)
        print("newId : \(newId)")
        XCTAssertEqual(newId.count, 11)
    }
}
