import React, { useState, useEffect } from 'react';
import Input from '@atoms/input.js';
import SubmitButton from '@atoms/SubmitButton.js';
import Span from '@atoms/Span.js';
import { Button } from '@atoms/Button.js';
import styled from 'styled-components';

const IssueSection = () => {
    const createIssue = async () => {
        const issueTitle = document.getElementById('issueTitle')?.value;
        const issueContent = document.getElementById('issueContent')?.value;

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
    };

    return (
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
    );
};

export default IssueSection;
