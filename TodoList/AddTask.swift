//
//  AddTask.swift
//  TodoList
//
//  Created by Carlos andres Diaz bravo  on 2020-05-08.
//  Copyright © 2020 Carlos andres Diaz bravo . All rights reserved.
//

import UIKit

class AddTableViewCell: UITableViewCell  {
  
  let nameTextField: UITextField = {
    let tf = UITextField()
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.font = UIFont.italicSystemFont(ofSize: 20)
    return tf
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(nameTextField)
    NSLayoutConstraint.activate([
      nameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      nameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      nameTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
      nameTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
