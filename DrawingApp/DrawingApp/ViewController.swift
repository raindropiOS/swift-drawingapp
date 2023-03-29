//
//  ViewController.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/27.
//

import UIKit
import OSLog

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomSquares(count: 4, size: Size(width: 150, height: 120))
    }
    
    func addRandomSquares(count: Int, size: Size) {
        guard count > 0 else { return }
        let customLogger = Logger(subsystem: "com.eddie.DrawingApp", category: "ViewController")
        
        // 좌표를 구할 때 어느 것을 써야하는지 다음 스텝에서 고민 예정 .UIScreen.main.bounds.size.width or self.view.frame.size.width
        for num in 1...count {
            let name = "Rect\(num)"
            let xBoundary = size.width...self.view.frame.size.width
            let yBoundary = 0...(self.view.frame.size.height - size.height)
            let x = Double.random(in: xBoundary)
            let y = Double.random(in: yBoundary)
            let point = Point(x: x, y: y)
            if let randomSquare = SquareFactory.makeSquare(point: point, size: size, kind: .random) as? RandomSquare {
                // TODO: 뷰에 추가하기
                customLogger.log("\(name) \(randomSquare.description)")
            }
            else {
                customLogger.log("SquareFactory failed to generate RandomSquare in addRandomSquares")
            }
        }
    }
}

