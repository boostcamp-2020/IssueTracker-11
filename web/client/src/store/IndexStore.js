import React from 'react';
import { CheckboxStore } from './CheckboxStore';
import { IssueStore } from './IssueStore';
const IndexStore = ({ children }) => {
    return (
        <CheckboxStore>
            <IssueStore>{children}</IssueStore>
        </CheckboxStore>
    );
};

export default IndexStore;
