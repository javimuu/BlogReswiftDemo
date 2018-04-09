//
//  AppReducer.swift
//  BlogContactDemo
//
//  Created by muu van duy on 2018/04/09.
//  Copyright © 2018 muuvanduy. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        contactListState: ContactListReducer().handleAction(action: action, state: state?.contactListState),
        contactDetailState: ContactDetailReducer().handleAction(action: action, state: state?.contactDetailState)
    )
}
