//
//  Task.swift
//  rxTodo
//
//  Created by Fernando Martin Garcia Del Angel on 11/02/20.
//  Copyright © 2020 Fernando Martin Garcia Del Angel. All rights reserved.
//

import Foundation

enum Priority: Int {
    case high
    case medium
    case low
}

struct Task {
    let title: String
    let priority: Priority
}
