//
//  TableViewCell.swift
//  TodoList
//
//  Created by Carlos andres Diaz bravo  on 2020-05-08.
//  Copyright © 2020 Carlos andres Diaz bravo . All rights reserved.
//

import UIKit
import QuartzCore

protocol TableViewCellDelegate {
    
    func toDoItemDeleted(todoItem: TodoItem)
}

class TableViewCell: UITableViewCell {
    
    let gradientLayer = CAGradientLayer()

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       
        gradientLayer.frame = bounds
        
        let color1 = UIColor(white: 1.0, alpha: 0.2).cgColor as CGColor
        let color2 = UIColor(white: 1.0, alpha: 0.1).cgColor as CGColor
        let color3 = UIColor.clear.cgColor as CGColor
        let color4 = UIColor(white: 0.0, alpha: 0.1).cgColor as CGColor
        gradientLayer.colors = [color1, color2, color3, color4]
        gradientLayer.locations = [0.0, 0.01, 0.95, 1.0]
        layer.insertSublayer(gradientLayer, at: 0)
   
        
        let recognizer = UIPanGestureRecognizer(target: self, action: Selector(("handlePan:")))
        recognizer.delegate = self
        addGestureRecognizer(recognizer)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    var delegate: TableViewCellDelegate?
 
    var toDoItem: TodoItem?
    
    var originalCenter = CGPoint()
    var deleteOnDragRelease = false
    
    func handlePan(recognizer: UIPanGestureRecognizer) {
  
        if recognizer.state == .began {

        originalCenter = center
      }
     
        if recognizer.state == .changed {
            let translation = recognizer.translation(in: self)
            center = CGPoint(x: originalCenter.x + translation.x, y: originalCenter.y)
       
        deleteOnDragRelease = frame.origin.x < -frame.size.width / 2.0
      }
        
        if deleteOnDragRelease {
            if delegate != nil && toDoItem != nil {
                delegate!.toDoItemDeleted(todoItem: toDoItem!)
            }
        }
      
        if recognizer.state == .ended {
       
        let originalFrame = CGRect(x: 0, y: frame.origin.y,
            width: bounds.size.width, height: bounds.size.height)
        if !deleteOnDragRelease {
         
        UIView.animate(withDuration: 0.2, animations: {self.frame = originalFrame})
        }
      }
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
            let translation = panGestureRecognizer.translation(in: superview!)
            if abs(translation.x) > abs(translation.y) {
                return true
            }
            return false
        }
        return false
    }
}
