//
//  ContactListReducer.swift
//  BlogContactDemo
//
//  Created by muu van duy on 2018/04/09.
//  Copyright © 2018 muuvanduy. All rights reserved.
//


import ReSwift

struct ContactListReducer {}

extension ContactListReducer {
    func handleAction(action: Action, state: ContactListState?) -> ContactListState {
        let prevState = state ?? ContactListState()
        var nextState = prevState
        
        switch action {
        case is RequestGetContactListAction:
            nextState.model = nil
        case let action as ResponseGetContactListAction:
            nextState.model = action.model
        case is ResponseUpdateContactDetailAction:
            nextState.model = nil
        default:
            break
        }
        
        return nextState
    }
}
