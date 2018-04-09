//
//  ContackDetailViewController.swift
//  BlogContactDemo
//
//  Created by muu van duy on 2018/04/09.
//  Copyright © 2018 muuvanduy. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    private let detailView = ContactDetailView()
    private let submitBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("更新", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .purple
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    fileprivate var contact: Contact!
    
    convenience init(contact _contact: Contact) {
        self.init()
        contact = _contact
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(detailView)
        view.addSubview(submitBtn)
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.nameTextField.delegate = self
        detailView.phoneTextField.delegate = self
        
        // set default value
        detailView.nameTextField.text = contact.name
        detailView.phoneTextField.text = contact.phoneNumber
        
        submitBtn.addTarget(self, action: #selector(updateContact), for: .touchUpInside)
        
        // detailView Constraints
        detailView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        detailView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        detailView.heightAnchor.constraint(greaterThanOrEqualToConstant: 270).isActive = true
        detailView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        detailView.bottomAnchor.constraint(equalTo: submitBtn.topAnchor, constant: -10).isActive = true
        
        // submitBtn Constraints
        submitBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        submitBtn.topAnchor.constraint(equalTo: detailView.bottomAnchor, constant: 10).isActive = true
        submitBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        submitBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        submitBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
        navigationItem.title = contact.name
    }
    
    @objc private func updateContact() {
        //　ボタンをくりっくして、見やすくしたいので、ボタンの色を変更します。
        submitBtn.backgroundColor = .darkGray
        
        view.endEditing(true)
        let name = detailView.nameTextField.text ?? ""
        let phoneNumber = detailView.phoneTextField.text ?? ""
        
        contact = ContactFixtures.updateData(with: contact.id, name: name, phone: phoneNumber)
        // 前のボタンの色を戻します。
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            self?.submitBtn.backgroundColor = .purple
        }
    }
}

extension ContactDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
