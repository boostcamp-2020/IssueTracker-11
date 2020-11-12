import React from 'react';
import Span from '@atoms/Span';
import LabelDropDown from './LabelDropDown';
import MilestoneDropDown from './MilestoneDropDown';
import AssigneeDropDown from './AssigneeDropDown';

const IssueAside = () => {
    return (
        <div style={{ border: '1px solid black', float: 'right', width: '30%', height: '100%' }}>
            <div style={{ height: '33%' }}>
                <LabelDropDown>
                    <Span>Labels</Span>
                    <Span>None yet </Span>
                </LabelDropDown>
            </div>
            <div style={{ height: '33%' }}>
                <MilestoneDropDown>
                    <Span>Milestones</Span>
                    <Span>No milestones </Span>
                </MilestoneDropDown>
            </div>
            <div style={{ height: '33%' }}>
                <AssigneeDropDown>
                    <Span>Assignees</Span>
                    <Span>No one assign yourself </Span>
                </AssigneeDropDown>
            </div>
        </div>
    );
};

export default IssueAside;
