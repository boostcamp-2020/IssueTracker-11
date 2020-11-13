import React, { useState, useEffect, useContext } from 'react';
import Input from '@atoms/Input.js';
import SubmitButton from '@atoms/SubmitButton.js';
import Span from '@atoms/Span.js';
import { Button } from '@atoms/Button.js';
import Markdown from '@atoms/Markdown';
import { AppContext } from '../../App.js';

const IssueSection = () => {
    const [issueContent, setIssueContent] = useState(null);
    const { getData } = useContext(AppContext);

    const createIssue = async () => {
        const issueTitle = document.getElementById('issueTitle')?.value;

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
        const { milestones, assignees, labels } = sortData();

        const issueData = {
            title: issueTitle,
            contents: issueContent,
            author: 1,
            milestone_id: milestones.map((el) => el.milestone_id),
            //assignees: assignees.map((el) => el.user_id),
            //labels: labels.map((el) => el.labels_id),
        };
        const cleanObj = (obj) => {
            for (let propName in obj) {
                if (obj[propName] === null || obj[propName] === undefined || obj[propName].length === 0) {
                    delete obj[propName];
                }
            }
            return obj;
        };

        const response = await fetch('http://49.50.160.103:3000/issues', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8',
            },
            body: JSON.stringify(cleanObj(issueData)),
        });
    };

    return (
        <div style={{ border: '1px solid black', float: 'left', width: '70%', height: '100%', padding: '30px' }}>
            <div style={{ border: '1px solid black', marginBottom: '30px' }}>
                <Input id="issueTitle" placeholder="Title" width="100%"></Input>
            </div>
            <div style={{ border: '1px solid black', height: '80%' }}>
                <Markdown setIssueContent={setIssueContent} />
            </div>
            <div style={{ border: '1px solid black', width: '100%', height: '5%' }}>
                <Span style={{ float: 'left' }}>Attach files by selecting here</Span>
            </div>
            <div style={{ float: 'right' }}>
                <SubmitButton text="Submit new issues" onClick={createIssue}></SubmitButton>
            </div>
            <div style={{ float: 'left' }}>
                <a href="/">
                    <Button height="30px" text="Cancel"></Button>
                </a>
            </div>
        </div>
    );
};

export default IssueSection;
