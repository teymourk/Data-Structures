//
//  LinkedList.swift
//  Practice
//
//  Created by Kiarash Teymoury on 11/2/17.
//  Copyright © 2017 Kiarash Teymoury. All rights reserved.
//

import UIKit

class Node<T> {
    let value: T
    var next : Node<T>?
    required init(_ value: T) {
        self.value = value
    }
}

