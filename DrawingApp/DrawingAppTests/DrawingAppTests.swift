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
    
    func testGenerateRandomId_길이가_음수일때_nil리턴() {
        let newId = IdGenerator.generateId(length: -5, separateAt: 1)
        XCTAssertNil(newId)
    }
    
    func testGenerateRandomId_길이가_0일때_nil리턴() {
        let newId = IdGenerator.generateId(length: 0, separateAt: 3)
        XCTAssertNil(newId)
    }
    
    func testGenerateRandomId_길이가_9이고_4글자위치에서_분리할때_11길이스트링리턴() {
        guard let newId = IdGenerator.generateId(length: 9, separateAt: 4) else { XCTFail("Id가 생성되지 않음"); return }
        print("newId : \(newId)")
        XCTAssertEqual(newId.value.count, 11)
    }
    
    func test_Plane의returnForefrontShape메소드_Shape범위에해당하는Point를전달했을때_해당하는Shape를리턴() {
        var plane = Plane()
        let rectangle = Rectangle(id: Id(value: "1"), point: Point(x: 50, y: 50), size: Size(width: 100, height: 100), bgColor: Color(r: 100, g: 150, b: 200), alpha: 5)
        let touchedPoint = Point(x: 75, y: 75)
        plane.addShape(rectangle)
        let result = plane.returnForefrontShape(at: touchedPoint) as! Rectangle
        
        XCTAssertTrue(result === rectangle)
    }
}
