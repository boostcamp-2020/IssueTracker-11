import React, { useReducer, useEffect } from 'react';

export const IssueContext = React.createContext();
const issueReducer = (issues, { type, data }) => {
    switch (type) {
        case 'GET':
            return data;
        case 'CREATE':
            return;
        case 'UPDATE':
            return;
        default:
            return issues;
    }
};

export const IssueStore = ({ children }) => {
    const [issues, issueDispatch] = useReducer(issueReducer, {});
    const setInitState = async () => {
        const response = await fetch('http://49.50.160.103:3000/issues');
        const data = await response.json();
        issueDispatch({ type: 'GET', data });
    };
    useEffect(() => {
        setInitState();
    }, []);
    return <IssueContext.Provider value={{ issues, issueDispatch }}>{children}</IssueContext.Provider>;
};

// 필터클릭시 input에 넣기 -> ref 로 돔 직접 가져오면?
