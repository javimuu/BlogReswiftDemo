//
//  ContactFixtures.swift
//  BlogContactDemo
//
//  Created by muu van duy on 2018/04/09.
//  Copyright © 2018 muuvanduy. All rights reserved.
//
import Foundation

struct ContactFixtures {
    public static var currentData: [Contact] = ContactFixtures.initializeData()
    
    public static func initializeData() -> [Contact] {
        let sources: [String: String] = ["John": "070-0000-0000", "Yamamoto": "070-0000-0001", "Tarou": "070-0000-0002"]
        let contacts = sources.enumerated().map { (offset, element) -> Contact in
            return Contact(id: offset + 1, name: element.key, phone: element.value)
        }
        return contacts
    }
    
    public static func updateData(with id: Int, name: String, phone: String) -> Contact {
        let newEntry: Contact = Contact(id: id, name: name, phone: phone)
        for (offset, data) in ContactFixtures.currentData.enumerated() {
            if data.id == id {
                ContactFixtures.currentData[offset] = newEntry
            }
        }
        
        return newEntry
    }
}
