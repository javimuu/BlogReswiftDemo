//
//  ContactDetailReducer.swift
//  BlogContactDemo
//
//  Created by muu van duy on 2018/04/09.
//  Copyright © 2018 muuvanduy. All rights reserved.
//

import ReSwift

struct ContactDetailReducer {}

extension ContactDetailReducer {
    func handleAction(action: Action, state: ContactDetailState?) -> ContactDetailState {
        let prevState = state ?? ContactDetailState()
        var nextState = prevState
        
        switch action {
        case is RefreshContactDetailAction:
            nextState.model = nil
        case is RequestUpdateContactDetailAction:
            nextState.model = nil
        case let action as ResponseUpdateContactDetailAction:
            nextState.model = action.model
        default:
            break
        }
        
        return nextState
    }
}
