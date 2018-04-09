//
//  Contact.swift
//  BlogContactDemo
//
//  Created by muu van duy on 2018/04/09.
//  Copyright © 2018 muuvanduy. All rights reserved.
//

import Foundation

struct Contact {
    let id: Int
    let name: String
    let phoneNumber: String
    
    init(id _id: Int, name _name: String, phone _number: String) {
        id = _id
        name = _name
        phoneNumber = _number
    }
}
