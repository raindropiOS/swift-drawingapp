//
//  ViewController.swift
//  DrawingApp
//
//  Created by 에디 on 2023/03/27.
//

import UIKit
import OSLog

class ViewController: UIViewController {
    
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        let point = tapGestureRecognizer.location(in: self.view)
    }
    
    @IBAction func rectangleButtonPressed(_ sender: Any) {
        drawRandomRectangle(size: Size(width: 150, height: 120))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomRectangles(count: 4, size: Size(width: 150, height: 120))
        let width = self.view.frame.width
        let height = self.view.frame.height
        let boundWidth = self.view.bounds.width
        let boundHeight = self.view.bounds.height
        print("")
    }
    
    func addRandomRectangles(count: Int, size: Size) {
        guard count > 0 else { return }
        let customLogger = Logger(subsystem: "com.eddie.DrawingApp", category: "ViewController")
        
        for num in 1...count {
            let name = "Rect\(num)"
            let xBoundary = 0...self.view.frame.size.width - size.width
//            let yBoundary = 0...self.view.frame.size.height - size.height
            let yBoundary = size.height...self.view.frame.size.height
            let x = Double.random(in: xBoundary)
            let y = Double.random(in: yBoundary)
            let point = Point(x: x, y: y)
            if let randomSquare = ShapeFactory.makeShape(point: point, size: size, kind: .random) as? Rectangle {
                // TODO: 뷰에 추가하기
                customLogger.log("\(name) \(randomSquare.description)")
            }
            else {
                customLogger.log("SquareFactory failed to generate RandomSquare in addRandomSquares")
            }
        }
    }
    
    func generateRandomPoint(basedOn size: Size) -> Point {
//        let xBoundary = 0...self.view.frame.size.width - size.width
        let xBoundary = 0...self.view.frame.width - size.width
//            let yBoundary = 0...self.view.frame.size.height - size.height
//        let yBoundary = size.height...self.view.frame.size.height
        let yBoundary = size.height...self.view.frame.height
        let x = Double.random(in: xBoundary)
        let y = Double.random(in: yBoundary)
        
        return Point(x: x, y: y)
    }
    
    func draw(rectangle: Rectangle) {
        let cgRect = returnCGRectFrom(point: rectangle.point, size: rectangle.size)
        let uiColor = returnUIColorFrom(color: rectangle.backgroundColor, alpha: rectangle.alpha)
        let uiView = UIView(frame: cgRect)
        
        uiView.backgroundColor = uiColor
        self.view.addSubview(uiView)
    }
    
    func drawRandomRectangle(size: Size) {
        let randomPoint = generateRandomPoint(basedOn: size)
        
        if let randomRectangle = ShapeFactory.makeShape(point: randomPoint, size: size, kind: .random) as? Rectangle {
            draw(rectangle: randomRectangle)
        } else {
            
        }
    }
    
    func returnCGRectFrom(point: Point, size: Size) -> CGRect {
        CGRect(x: Int(point.x), y: Int(point.y), width: Int(size.width), height: Int(size.height))
    }
    
    func returnUIColorFrom(color: Color, alpha: Int) -> UIColor {
        UIColor(red: CGFloat(color.r), green: CGFloat(color.g), blue: CGFloat(color.b), alpha: CGFloat(alpha))
    }
}

