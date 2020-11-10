import React from 'react';
import LabelDropDown from './LabelDropDown';
import MilestoneDropDown from './MilestoneDropDown';
import AssigneeDropDown from './AssigneeDropDown';

const IssueAside = () => {
    return (
        <div style={{ border: '1px solid black', float: 'right', width: '30%', height: '100%' }}>
            <div style={{ height: '33%' }}>
                <LabelDropDown></LabelDropDown>
            </div>
            <div style={{ height: '33%' }}>
                <MilestoneDropDown></MilestoneDropDown>
            </div>
            <div style={{ height: '33%' }}>
                <AssigneeDropDown></AssigneeDropDown>
            </div>
        </div>
    );
};

export default IssueAside;
