//
//  ViewController.swift
//  TodoList
//
//  Created by Carlos andres Diaz bravo  on 2020-05-08.
//  Copyright © 2020 Carlos andres Diaz bravo . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TableViewCellDelegate {
    
    
@IBOutlet var tableView: UITableView!
    var toDoItems = [TodoItem]()
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.rowHeight = 50.0
        tableView.backgroundColor = UIColor.black
      
       
        
        
        if toDoItems.count > 0 {
            return
        }
        toDoItems.append(TodoItem(text: "Assignment 6"))
        toDoItems.append(TodoItem(text: "Assignment 7"))
        toDoItems.append(TodoItem(text: "Assignment 8"))
        toDoItems.append(TodoItem(text: "Assignment 9"))
        toDoItems.append(TodoItem(text: "buy a new iPhone"))
        toDoItems.append(TodoItem(text: "Assignment 10"))
       
       
    }
    
  
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
             return 1
         }

       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return toDoItems.count
         }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            as! TableViewCell
            cell.textLabel?.backgroundColor = UIColor.clear
            cell.selectionStyle = .none
           
        let item = toDoItems[indexPath.row]
            cell.textLabel?.text = item.text
            return cell
       }
    private func tableView(tableView: UITableView, heightForRowAtIndexPath
        indexPath: NSIndexPath) -> CGFloat {
        return tableView.rowHeight;
    }
    
    func toDoItemDeleted(todoItem toDoItem: TodoItem) {
          let index = (toDoItems as NSArray).index(of: toDoItem)
        if index == NSNotFound { return }
          toDoItems.remove(at: index)
          tableView.beginUpdates()
          _ = NSIndexPath(row: index, section: 0)
          //tableView.deleteRows(at: 1, with: .fade)
        tableView.endUpdates()
      }
      
    
 
    func colorForIndex(index: Int) -> UIColor {
       let itemCount = toDoItems.count - 1
       let val = (CGFloat(index) / CGFloat(itemCount)) * 0.6
       return UIColor(red: 1.0, green: val, blue: 0.0, alpha: 1.0)
   }
       
    private func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
                           forRowAtIndexPath indexPath: NSIndexPath) {
    cell.backgroundColor = colorForIndex(index: indexPath.row)
   }
  


}

