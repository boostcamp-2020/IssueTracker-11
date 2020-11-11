import React, { useState, useEffect } from 'react';
import Input from '@atoms/input.js';
import SubmitButton from '@atoms/SubmitButton.js';
import Span from '@atoms/Span.js';
import { Button } from '@atoms/Button.js';
import styled from 'styled-components';
import DropDown from '../organisms/DropDown';

const MilestoneDropDown = () => {
    const [milestones, setMilestones] = useState(null);

    useEffect(() => {
        const getMilestones = () => {
            fetch('http://49.50.160.103:3000/milestones')
                .then((res) => res.json())
                .then((res) => {
                    setMilestones(res.data);
                });
        };
        getMilestones();
    }, []);
    if (!milestones) return <div></div>;

    return (
        <div style={{ border: '1px solid black', height: '100%' }}>
            <DropDown items={milestones} subject="Milestones" style={{ float: 'right' }}>
                <Span>Milestones</Span>
                <Span>No milestones </Span>
            </DropDown>
        </div>
    );
};

export default MilestoneDropDown;
