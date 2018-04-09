//
//  ContactFixtures.swift
//  BlogContactDemo
//
//  Created by muu van duy on 2018/04/09.
//  Copyright © 2018 muuvanduy. All rights reserved.
//

import Foundation

struct ContactFixtures {
    public static func initializeData() -> [Contact] {
        let sources: [String: String] = ["John": "070-0000-0000", "Hiroki": "070-0000-0001", "Tarou": "070-0000-0002"]
        let contacts = sources.map { Contact(name: $0, phone: $1) }
        return contacts
    }
}
