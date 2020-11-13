import React, { useContext } from 'react';
import Span from '@atoms/Span';
import LabelDropDown from './LabelDropDown';
import MilestoneDropDown from './MilestoneDropDown';
import AssigneeDropDown from './AssigneeDropDown';
import { AppContext } from '../../App.js';

const IssueAside = () => {
    const { getData } = useContext(AppContext);

    const sortData = () => {
        const datas = getData();
        const labels = [];
        const assignees = [];
        const milestones = [];

        for (let i = 0; i < datas.length; i++) {
            if (datas[i].hasOwnProperty('label_id')) labels.push(datas[i]);
            if (datas[i].hasOwnProperty('user_id')) assignees.push(datas[i]);
            if (datas[i].hasOwnProperty('milestone_id')) {
                if (milestones.length === 0) milestones.push(datas[i]);
            }
        }
        return { labels, assignees, milestones };
    };

    const { labels, assignees, milestones } = sortData();

    return (
        <div style={{ border: '1px solid black', float: 'right', width: '30%', height: '100%' }}>
            <div style={{ height: '33%' }}>
                <LabelDropDown>
                    {labels.length === 0 ? (
                        <div>
                            <Span>Labels</Span>
                            <Span>None yet </Span>
                        </div>
                    ) : (
                        labels.map((label) => (
                            <div style={{ border: '1px solid red', justifyContent: 'center', alignItems: 'center' }}>
                                {label.name}
                            </div>
                        ))
                    )}
                </LabelDropDown>
            </div>
            <div style={{ height: '33%' }}>
                <MilestoneDropDown>
                    {milestones.length === 0 ? (
                        <div>
                            <Span>Milestones</Span>
                            <Span>No milestones </Span>
                        </div>
                    ) : (
                        milestones.map((label) => (
                            <div style={{ border: '1px solid red', justifyContent: 'center', alignItems: 'center' }}>
                                {label.title}
                            </div>
                        ))
                    )}
                </MilestoneDropDown>
            </div>
            <div style={{ height: '33%' }}>
                <AssigneeDropDown>
                    {assignees.length === 0 ? (
                        <div>
                            <Span>Assignees</Span>
                            <Span>No one assign yourself </Span>
                        </div>
                    ) : (
                        assignees.map((label) => (
                            <div style={{ border: '1px solid red', justifyContent: 'center', alignItems: 'center' }}>
                                {label.email}
                            </div>
                        ))
                    )}
                </AssigneeDropDown>
            </div>
        </div>
    );
};

export default IssueAside;
