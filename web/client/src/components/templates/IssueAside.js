import React from 'react';
import LabelDropDown from './LabelDropDown';
import MilestoneDropDown from './MilestoneDropDown';
import AssigneeDropDown from './AssigneeDropDown';

const IssueAside = () => {
    return (
        <div style={{ border: '1px solid black', float: 'right', width: '30%', height: '100%' }}>
            <LabelDropDown></LabelDropDown>
            <MilestoneDropDown></MilestoneDropDown>
            <AssigneeDropDown></AssigneeDropDown>
        </div>
    );
};

export default IssueAside;
