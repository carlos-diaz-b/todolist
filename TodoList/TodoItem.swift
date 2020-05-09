//
//  TodoItem.swift
//  TodoList
//
//  Created by Carlos andres Diaz bravo  on 2020-05-08.
//  Copyright © 2020 Carlos andres Diaz bravo . All rights reserved.
//

import UIKit

class TodoItem: NSObject {

    var text: String

    // A Boolean value that determines the completed state of this item.
    var completed: Bool

    // Returns a ToDoItem initialized with the given text and default completed value.
    init(text: String) {
        self.text = text
        self.completed = false
    }
    
}
