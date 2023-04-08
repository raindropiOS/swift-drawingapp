//
//  RangedValue.swift
//  DrawingApp
//
//  Created by 에디 on 2023/04/08.
//

import Foundation

@propertyWrapper
struct RangedValue<V: Comparable> {
    private var value: V
    private var maximum: V
    private var minimum: V
    
    var wrappedValue: V {
        get { return  value }
        set {
            if newValue > maximum { value = maximum; return }
            if newValue < minimum { value = minimum; return }
            value = newValue
        }
    }
    
    init(wrappedValue: V, minimum: V, maximum: V) {
        value = wrappedValue
        self.minimum = minimum
        self.maximum = maximum
        assert(value >= minimum && value <= maximum)
    }
}
