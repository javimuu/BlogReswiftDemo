//
//  ContactDetailView.swift
//  BlogContactDemo
//
//  Created by muu van duy on 2018/04/09.
//  Copyright © 2018 muuvanduy. All rights reserved.
//

import UIKit

class ContactDetailView: UIView {
    let nameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "名前"
        lb.textColor = .magenta
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let nameTextField: RoundedTextField = {
        let tf = RoundedTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let phoneLabel: UILabel = {
        let lb = UILabel()
        lb.text = "電話番号"
        lb.textColor = .magenta
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let phoneTextField: RoundedTextField = {
        let tf = RoundedTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(phoneLabel)
        addSubview(phoneTextField)
        
        // nameLabel Constraints
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        // nameTextField Constraints
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        // phoneLabel Constraints
        phoneLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        phoneLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        phoneLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        phoneLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        // phoneTextField Constraints
        phoneTextField.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        phoneTextField.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10).isActive = true
        phoneTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        phoneTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
