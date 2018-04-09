//
//  ContactDetailActions.swift
//  BlogContactDemo
//
//  Created by muu van duy on 2018/04/09.
//  Copyright © 2018 muuvanduy. All rights reserved.
//

import ReSwift

struct RequestUpdateContactDetailAction: Action {}

struct ResponseUpdateContactDetailAction: Action {
    let model: Contact
}

struct RefreshContactDetailAction: Action {}

extension ContactDetailState {
    static func updateContact(with id: Int, name: String, phone: String) -> Store<AppState>.AsyncActionCreator {
        return { (state, store, callback) in
            store.dispatch(RequestUpdateContactDetailAction())
            // TODO API接続
            let contact = ContactFixtures.updateData(with: id, name: name, phone: phone)
            callback { _,_ in ResponseUpdateContactDetailAction(model: contact) }
        }
    }
}
