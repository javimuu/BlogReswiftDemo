//
//  Actions.swift
//  BlogContactDemo
//
//  Created by muu van duy on 2018/04/09.
//  Copyright © 2018 muuvanduy. All rights reserved.
//

import ReSwift

struct RequestGetContactListAction: Action {}

struct ResponseGetContactListAction: Action {
    let model: [Contact]
}

extension ContactListState {
    static func getContactList() -> Store<AppState>.AsyncActionCreator {
        return { (state, store, callback) in
            store.dispatch(RequestGetContactListAction())
            callback { _,_ in ResponseGetContactListAction(model: ContactFixtures.currentData) }
        }
    }
}

