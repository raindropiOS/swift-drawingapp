//
//  ViewController.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/27.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomSquares(count: 4, width: 150, height: 120)
    }
    
    func addRandomSquares(count: Int, width: Double, height: Double) {
        guard count > 0 else { return }
        
        // 좌표를 구할 때 어느 것을 써야하는지 고민.UIScreen.main.bounds.size.width or self.view.frame.size.width
        for num in 1...count {
            let name = "Rect \(num)"
            let xBoundary = width...self.view.frame.size.width
            let yBoundary = 0...(self.view.frame.size.height - height)
            let x = Double.random(in: xBoundary)
            let y = Double.random(in: yBoundary)
            
            let square = SquareFactory.makeSquare(x: x, y: y, width: width, height: height, kind: .random)
            self.view.addSubview(square as! UIView)
        }
    }
}

