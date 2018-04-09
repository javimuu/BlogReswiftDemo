//
//  AppState.swift
//  BlogContactDemo
//
//  Created by muu van duy on 2018/04/09.
//  Copyright © 2018 muuvanduy. All rights reserved.
//

import ReSwift

struct AppState: StateType {
    let contactListState: ContactListState
    let contactDetailState: ContactDetailState
}

