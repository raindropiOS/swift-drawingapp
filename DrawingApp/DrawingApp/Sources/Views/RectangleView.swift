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
    
    // 어쩔 수 없이 작성한 init
    required init?(coder: NSCoder) {
        id = Id(value: "error")
        super.init(coder: coder)
    }
}
