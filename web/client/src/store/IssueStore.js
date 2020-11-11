import React, { useReducer } from 'react';

export const IssueContext = React.createContext();
const issueReducer = (issues, { type }) => {
    switch (type) {
        case 'A':
            return;
        case 'B':
            return;
        default:
            return;
    }
};

export const IssueStore = ({ children }) => {
    const [issues, issueDispatch] = useReducer(issueReducer, []);
    return <IssueContext.Provider value={{ issues, issueDispatch }}></IssueContext.Provider>;
};
