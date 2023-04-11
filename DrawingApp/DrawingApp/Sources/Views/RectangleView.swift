//
//  RectangleView.swift
//  DrawingApp
//
//  Created by 에디 on 2023/04/03.
//

import UIKit

class RectangleView: UIView, ShapeView {
    var id: Id
    
    init(frame: CGRect, id: Id) {
        self.id = id
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        let idFactory = IdFactory()
        id = idFactory.makeId(length: 9, separateAt: 4) ?? Id(value: "")
        super.init(coder: coder)
    }
}
