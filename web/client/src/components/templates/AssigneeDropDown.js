import React, { useState, useEffect } from 'react';
import Input from '@atoms/input.js';
import SubmitButton from '@atoms/SubmitButton.js';
import Span from '@atoms/Span.js';
import { Button } from '@atoms/Button.js';
import styled from 'styled-components';
import DropDown from '../organisms/DropDown';

const LabelDropDown = () => {
    const [users, setUsers] = useState(null);

    useEffect(() => {
        const getusers = () => {
            fetch('http://49.50.160.103:3000/users')
                .then((res) => res.json())
                .then((res) => {
                    setUsers(res.data);
                });
        };
        getusers();
    }, []);

    return (
        <div style={{ border: '1px solid black' }}>
            <DropDown subject="Label" isClicked={true} style={{ float: 'right' }}></DropDown>
            <Span>Assignees</Span>
            <Span>No one assign yourself </Span>
        </div>
    );
};

export default LabelDropDown;
