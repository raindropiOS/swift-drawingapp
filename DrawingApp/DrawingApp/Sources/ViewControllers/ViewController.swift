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
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var backgroundColorChangeButton: UIButton!
    @IBOutlet weak var RectangleColorControl: UIView!
    var selectedShapeView: ShapeView?
    var plane = Plane()
    let shapeFactory: ShapeProducible = ShapeFactory()
    let colorFactory: ColorAlphaProducible = ColorFactory()
    let logger = Logger(subsystem: "com.eddie.DrawingApp", category: "ViewController")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Logger로 출력만 하고 뷰에 그리진 않음
        addRandomRectangles(count: 4, size: Size(width: 150, height: 120))
    }
    
    @IBAction func backgroundColorChangeButtonPressed(_ sender: Any) {
        guard let selectedShapeView = selectedShapeView else {
            logger.log("[backgroundColorChangeButtonPressed] selectedShapeView이 현재 nil이어서 색상을 바꿀 수 없음")
            return
        }
        let id: Id = selectedShapeView.id
        let newColor: Color = colorFactory.makeRandomColor()
        let newAlpha: Alpha = colorFactory.makeRandomAlpha()
        let newUiColor: UIColor = returnUIColorFrom(color: newColor, alpha: newAlpha)
        
        plane.setComponentAlphaWith(newAlpha, id: id)
        plane.setComponentColorWith(newColor, id: id)
        setBackgroundColorOf(selectedShapeView, with: newUiColor)
        backgroundColorChangeButton.setTitle("\(newUiColor.toHexString())", for: .normal)
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        let cgPoint: CGPoint = tapGestureRecognizer.location(in: self.view)
        let point: Point = returnPointFrom(cgpoint: cgPoint)
        let tappedShape: Shape? = plane.returnForefrontShape(at: point)
        
        if let shape = tappedShape {
            // Shape이 존재하는 곳을 탭했을 때
            // 이전에 선택된 shape 처리
            selectedShapeView?.layer.borderWidth = 0.0
            // 새롭게 선택된 shape 처리
            if let newlySelectedShapeView = findShapeView(with: shape.id) {
                newlySelectedShapeView.layer.borderWidth = 3.0
                //TODO: alph값 1.0으로 변경하기
                newlySelectedShapeView.layer.borderColor = CGColor(red: 170/255, green: 74/255, blue: 68/255, alpha: 1.0)
                //TODO: slider 값 설정 부분 수정
                if let backgroundColor = newlySelectedShapeView.backgroundColor {
                    alphaSlider.setValue(Float(backgroundColor.getBackgroundColorAlpha()), animated: true)
                    backgroundColorChangeButton.setTitle(backgroundColor.toHexString(), for: .normal)
                }
                selectedShapeView = newlySelectedShapeView
                    
            }
        } else {
            // Shape이 존재하지 않는 곳을 탭했을 때
            selectedShapeView?.layer.borderWidth = 0.0
            selectedShapeView = nil
            alphaSlider.setValue(0.5, animated: true)
            backgroundColorChangeButton.setTitle("선택된 도형이 없습니다.", for: .normal)
        }
    }
    
    @IBAction func alphaSliderValueChanged(_ sender: Any) {
        let newAlphaValue = CGFloat(alphaSlider.value)
        let newAlphaValueColor = selectedShapeView?.backgroundColor?.withAlphaComponent(newAlphaValue)
        selectedShapeView?.backgroundColor = newAlphaValueColor
    }
    
    @IBAction func rectangleButtonPressed(_ sender: Any) {
        drawRandomRectangle(size: Size(width: 150, height: 120))
    }
    
    func findShapeView(with id: Id) -> ShapeView? {
        for subview in self.view.subviews {
            if let selectedView = subview as? ShapeView {
                if selectedView.id.value == id.value {
                    return selectedView
                }
            }
        }
        return nil
    }
    
    // Logger출력용
    func addRandomRectangles(count: Int, size: Size) {
        guard count > 0 else { return }
        
        for num in 1...count {
            let name = "Rect\(num)"
            let xBoundary = 0...self.canvasView.frame.size.width - size.width
            let yBoundary = 0...self.canvasView.frame.size.height - size.height
            let x = Double.random(in: xBoundary)
            let y = Double.random(in: yBoundary)
            let point = Point(x: x, y: y)
            if let randomSquare = shapeFactory.makeShape(origin: point, size: size, kind: .randomRectangle) {
                // TODO: 뷰에 추가하기
                logger.log("\(name) \(randomSquare.description)")
            }
            else {
                logger.log("SquareFactory failed to generate RandomSquare in addRandomSquares")
            }
        }
    }
    
    func generateRandomPoint(basedOn size: Size) -> Point {
        let xBoundary = 0...self.canvasView.frame.size.width - size.width
        let yBoundary = 0...self.canvasView.frame.size.height - size.height
        let x = Double.random(in: xBoundary)
        let y = Double.random(in: yBoundary)
        
        return Point(x: x, y: y)
    }
    
    func returnRectangleViewFrom(shape: Shape) -> UIView {
        let cgRect = returnCGRectFrom(point: shape.origin, size: shape.size)
        let uiColor = returnUIColorFrom(color: shape.backgroundColor, alpha: shape.alpha)
        let uiView = RectangleView(frame: cgRect, id: shape.id)
        
        uiView.backgroundColor = uiColor
        plane.addShape(shape)
        return uiView
    }
    
    func drawRandomRectangle(size: Size) {
        let randomPoint = generateRandomPoint(basedOn: size)
        
        if let randomRectangle = shapeFactory.makeShape(origin: randomPoint, size: size, kind: .randomRectangle) {
            let uiView = returnRectangleViewFrom(shape: randomRectangle)
            self.view.addSubview(uiView)
        } else {
            //TODO: 불필요한 else문 삭제
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
    
    func setBackgroundColorOf(_ shapeView: ShapeView, with color: UIColor) {
        shapeView.backgroundColor = color
    }
}

