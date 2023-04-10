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
    @IBOutlet weak var addShapeButton: UIButton!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var backgroundColorChangeButton: UIButton!
    @IBOutlet weak var RectangleColorControl: UIView!
    var selectedShapeView: ShapeView?
    var plane: PlaneLike = Plane()
    let shapeFactory: ShapeProducible = ShapeFactory()
    let colorFactory: ColorAlphaProducible = ColorFactory()
    let logger = Logger(subsystem: "com.eddie.DrawingApp", category: "ViewController")
    let rectangleSize: Size = Size(width: 150, height: 120)
    let selectedShapeBorderColor: CGColor = CGColor(red: 170/255, green: 74/255, blue: 68/255, alpha: 1.0)
    lazy var canvasViewWidth = self.canvasView.frame.size.width
    lazy var canvasViewHeight = self.canvasView.frame.size.height
    let selectedShapeBorderWidth: CGFloat = 4.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Logger로 출력만 하고 뷰에 그리진 않음
        addRandomRectangles(count: 4, size: rectangleSize)
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
        let cgPoint: CGPoint = tapGestureRecognizer.location(in: self.canvasView)
        let point: Point = returnPointFrom(cgpoint: cgPoint)
        let tappedShape: Shape? = plane.returnForefrontShape(at: point)
        
        if let shape = tappedShape {
            // Shape이 존재하는 곳을 탭했을 때
            // 이전에 선택된 shape 처리
            selectedShapeView?.layer.borderWidth = 0.0
            // 새롭게 선택된 shape 처리
            if let newlySelectedShapeView = findShapeView(with: shape.id) {
                newlySelectedShapeView.layer.borderWidth = selectedShapeBorderWidth
                newlySelectedShapeView.layer.borderColor = selectedShapeBorderColor
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
        drawRandomRectangle(size: rectangleSize)
    }
    
    func findShapeView(with id: Id) -> ShapeView? {
        for subview in self.canvasView.subviews {
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
            
            if let randomRectangle = shapeFactory.makeRandomSqure(sizeOfView: Point(x: canvasViewWidth, y: canvasViewWidth), rectangleSize: rectangleSize) {
                logger.log("\(name) \(randomRectangle.description)")
            }
            else {
                logger.log("SquareFactory failed to generate RandomSquare in addRandomSquares")
            }
        }
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
        
        
        if let randomRectangle = shapeFactory.makeRandomSqure(sizeOfView: Point(x: canvasViewWidth, y: canvasViewHeight), rectangleSize: rectangleSize) {
            let uiView = returnRectangleViewFrom(shape: randomRectangle)
            self.canvasView.insertSubview(uiView, belowSubview: addShapeButton)
        } else {
            logger.log("[ViewController.drawRandomRectangle] shapeFactory.makeShape가 nil을 반환했습니다. Shape가 만들어지지 않았습니다.")
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

