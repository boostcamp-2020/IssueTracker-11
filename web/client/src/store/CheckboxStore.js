import React, { useReducer } from 'react';

export const CheckboxContext = React.createContext();
const checkboxReducer = (checkState, { type, data }) => {
    const newState = { ...checkState };
    switch (type) {
        case 'INIT':
            if (data.name === 'checkAll') newState.checkAllBox = data;
            else newState.checkboxies.add(data);
            return newState;
        case 'CHECK_ONE_TRUE':
            newState.ids.add(parseInt(data));
            if (newState.ids.size === newState.checkboxies.size) {
                newState.checkAllBox.checked = true;
                newState.allChecked = true;
            }
            return newState;
        case 'CHECK_ONE_FALSE':
            if (newState.allChecked) newState.checkAllBox.checked = false;
            newState.ids.delete(parseInt(data));
            return newState;
        case 'CHECK_ALL_TRUE':
            newState.allChecked = true;
            newState.checkboxies.forEach((checkbox) => {
                checkbox.checked = true;
                newState.ids.add(checkbox.value);
            });
            return newState;
        case 'CHECK_ALL_FALSE':
            newState.allChecked = false;
            newState.checkboxies.forEach((checkbox) => {
                checkbox.checked = false;
            });
            newState.ids.clear();
            return newState;
        default:
            console.log('default ??');
            return checkState;
    }
};

export const CheckboxStore = ({ children }) => {
    const [checkState, dispatch] = useReducer(checkboxReducer, {
        allChecked: false,
        ids: new Set(),
        checkboxies: new Set(),
        checkAllBox: null,
    });
    return <CheckboxContext.Provider value={{ checkState, dispatch }}>{children}</CheckboxContext.Provider>;
};
