import React from 'react';
import styled from 'styled-components';
import { Button } from '../atoms/Button';
import SubmitButton from '@atoms/SubmitButton';
import Input from '../atoms/Input';
import Span from '../atoms/Span';
import DropDown from '../organisms/DropDown';

const IssueNote = () => {
    const createIssue = async () => {
        const issueTitle = document.getElementById('issueTitle')?.value;
        const issueContent = document.getElementById('issueContent')?.value;
        console.log('버튼 클릭됨.');
        const data = {
            title: issueTitle,
            contents: issueContent,
            author: 1,
        };

        const response = await fetch('http://49.50.160.103:3000/issues', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8',
            },
            body: JSON.stringify(data),
        });
        console.log(response);
    };

    const dropDowns = [
        { subject: 'Label', isClicked: true },
        { subject: 'Milestones', isClicked: true },
        { subject: 'Assignee', isClicked: true },
    ];

    return (
        <div style={{ border: '1px solid black', display: 'inline-block', width: '100%', height: '500px' }}>
            <div style={{ border: '1px solid black', float: 'left', width: '70%', height: '100%', padding: '30px' }}>
                <div style={{ border: '1px solid black', marginBottom: '30px' }}>
                    <Input id="issueTitle" placeholder="Title" width="100%"></Input>
                </div>
                <div style={{ border: '1px solid black', height: '80%' }}>
                    <Input id="issueContent" placeholder="Leave a comments" width="100%" height="100%"></Input>
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

            <div style={{ border: '1px solid black', float: 'right', width: '30%', height: '100%' }}>
                <div style={{ border: '1px solid black' }}>
                    <DropDown
                        subject={dropDowns[0].subject}
                        isClicked={dropDowns[0].isClicked}
                        style={{ float: 'right' }}
                    ></DropDown>
                    <Span>Assignees</Span>
                    <Span>No one assign yourself </Span>
                </div>
                <div style={{ border: '1px solid black' }}>
                    <DropDown
                        subject={dropDowns[0].subject}
                        isClicked={dropDowns[0].isClicked}
                        style={{ float: 'right' }}
                    ></DropDown>
                    <Span>Labels</Span>
                    <Span>None yet </Span>
                </div>
                <div style={{ border: '1px solid black' }}>
                    <DropDown
                        subject={dropDowns[0].subject}
                        isClicked={dropDowns[0].isClicked}
                        style={{ float: 'right' }}
                    ></DropDown>
                    <Span>Milestones</Span>
                    <Span>No milestones </Span>
                </div>
            </div>
        </div>
    );
};

export default IssueNote;
