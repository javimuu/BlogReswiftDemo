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
    typealias ReducerStateType = ContactListState
    func handleAction(action: Action, state: ReducerStateType?) -> ReducerStateType {
        let prevState = state ?? ContactListState()
        var nextState = prevState
        
        print(action, "aaa")
        switch action {
        case is RequestGetContactListAction:
            nextState.model = nil
        case let action as ResponseGetContactListAction:
            nextState.model = action.model
        case is ResponseUpdateContactDetailAction:
            print("bbbb")
            nextState.model = nil
        default:
            break
        }
        
        return nextState
    }
}
