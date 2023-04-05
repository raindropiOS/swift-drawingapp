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
    @IBOutlet weak var canvasView: UIView!
    var selectedUIView: UIView?
    var plane = Plane()
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        let cgPoint = tapGestureRecognizer.location(in: self.view)
        let point = returnPointFrom(cgpoint: cgPoint)
        let tappedShape: Shape? = plane.returnForefrontShape(at: point)
        
        if tappedShape != nil {
            let rectangle = tappedShape as! Rectangle
            
            selectedUIView?.layer.borderWidth = 0.0
            selectedUIView = findSubview(withId: rectangle.id)
            selectedUIView?.layer.borderWidth = 3.0
            selectedUIView?.layer.borderColor = CGColor(red: 170/255, green: 74/255, blue: 68/255, alpha: 1.0)
        } else {
            selectedUIView?.layer.borderWidth = 0.0
            selectedUIView = nil
        }
    }
    
    @IBAction func rectangleButtonPressed(_ sender: Any) {
        drawRandomRectangle(size: Size(width: 150, height: 120))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Logger로 출력만 하고 뷰에 그리진 않음
        addRandomRectangles(count: 4, size: Size(width: 150, height: 120))
    }
    
    func findSubview(withId id: Id) -> UIView? {
        for subview in self.view.subviews {
            if subview is HaveId {
                let selected = subview as! RectangleView
                if selected.id.value == id.value {
                    return selected
                }
            }
        }
        return nil
    }
    
    // Logger출력용
    func addRandomRectangles(count: Int, size: Size) {
        guard count > 0 else { return }
        let customLogger = Logger(subsystem: "com.eddie.DrawingApp", category: "ViewController")
        
        for num in 1...count {
            let name = "Rect\(num)"
            let xBoundary = 0...self.canvasView.frame.size.width - size.width
            let yBoundary = size.height...self.canvasView.frame.size.height
            let x = Double.random(in: xBoundary)
            let y = Double.random(in: yBoundary)
            let point = Point(x: x, y: y)
            if let randomSquare = ShapeFactory.makeShape(point: point, size: size, kind: .randomRectangle) as? Rectangle {
                // TODO: 뷰에 추가하기
                customLogger.log("\(name) \(randomSquare.description)")
            }
            else {
                customLogger.log("SquareFactory failed to generate RandomSquare in addRandomSquares")
            }
        }
    }
    
    func generateRandomPoint(basedOn size: Size) -> Point {
        let xBoundary = 0...self.canvasView.frame.width - size.width
        let yBoundary = size.height...self.canvasView.frame.height
        let x = Double.random(in: xBoundary)
        let y = Double.random(in: yBoundary)
        
        return Point(x: x, y: y)
    }
    
    func returnRectangleViewFrom(rectangle: Rectangle) -> UIView {
        let cgRect = returnCGRectFrom(point: rectangle.point, size: rectangle.size)
        let uiColor = returnUIColorFrom(color: rectangle.backgroundColor, alpha: rectangle.alpha)
        let uiView = RectangleView(frame: cgRect, id: rectangle.id)
        
        uiView.backgroundColor = uiColor
        
        plane.addShape(rectangle)
        return uiView
    }
    
    func drawRandomRectangle(size: Size) {
        let randomPoint = generateRandomPoint(basedOn: size)
        
        if let randomRectangle = ShapeFactory.makeShape(point: randomPoint, size: size, kind: .randomRectangle) as? Rectangle {
            let uiView = returnRectangleViewFrom(rectangle: randomRectangle)
            self.view.addSubview(uiView)
        } else {
            
        }
    }
    
    func returnCGRectFrom(point: Point, size: Size) -> CGRect {
        CGRect(x: Int(point.x), y: Int(point.y), width: Int(size.width), height: Int(size.height))
    }
    
    func returnUIColorFrom(color: Color, alpha: Alpha) -> UIColor {
        UIColor(red: CGFloat(color.r), green: CGFloat(color.g), blue: CGFloat(color.b), alpha: CGFloat(alpha.rawValue))
    }
    
    func returnPointFrom(cgpoint: CGPoint) -> Point {
        let x = Double(cgpoint.x)
        let y = Double(cgpoint.y)
        
        return Point(x: x, y: y)
    }
}

