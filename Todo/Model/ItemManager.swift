//
//  ItemManager.swift
//  Todo
//
//  Created by Jose Alvarez on 7/25/17.
//  Copyright © 2017 CoStar. All rights reserved.
//

import Foundation

class ItemManager {
    var todoCount: Int { return todoItems.count }
    var doneCount: Int { return doneItems.count }
    private var todoItems = [ToDoItem]()
    private var doneItems = [ToDoItem]()
    
    func add(_ item: ToDoItem) {
        if !todoItems.contains(item) {
            todoItems.append(item)
        }
    }
    
    func item(at index: Int) -> ToDoItem {
        return todoItems[index]
    }
    
    func checkItem(at index: Int) {
        let item = todoItems.remove(at: index)
        doneItems.append(item)
    }
    
    func uncheckItem(at index: Int) {
        let item = doneItems.remove(at: index)
        todoItems.append(item)
    }
    
    func doneItem(at index: Int) -> ToDoItem {
        return doneItems[index]
    }
    
    func removeAll() {
        todoItems.removeAll()
        doneItems.removeAll()
    }
}
