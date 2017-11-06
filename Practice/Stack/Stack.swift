//
//  Stack.swift
//  Practice
//
//  Created by Kiarash Teymoury on 11/2/17.
//  Copyright © 2017 Kiarash Teymoury. All rights reserved.
//

import UIKit

class Stack<T> {
    
    private var top: Node<T>?
    private var _count: Int = 0
    
    var isEmpty: Bool {
        return top == nil
    }
    
    var count: Int {
        get {
            while top != nil {
                _count += 1
                top = top?.next
            }
            return _count
        }
    }
    
    func push(_ value: T) {
        let oldTop = top
        top = Node(value)
        top?.next = oldTop
    }
    
    func pop() -> T? {
        return nil
    }
    
    var peek: T? {
        return top?.value
    }
}
