import React, { useReducer } from 'react';

export const CheckboxContext = React.createContext();

const checkboxReducer = (checkState, { type, issueId }) => {
    const newState = { ...checkState };
    let idx = -1;
    switch (type) {
        case 'CHECK_ONE_TRUE':
            newState.ids.push(issueId);
            return newState;
        case 'CHECK_ONE_FALSE':
            idx = newState.ids.indexOf(issueId);
            if (idx > -1) newState.ids.splice(idx, 1);
            return newState;
        case 'CHECK_ALL':
            checkState.allChecked = true;
            console.log(checkState);
            return checkState;
        default:
            console.log('default ??');
            return checkState;
    }
};
