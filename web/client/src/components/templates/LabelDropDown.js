import React, { useState, useEffect } from 'react';
import Input from '@atoms/input.js';
import SubmitButton from '@atoms/SubmitButton.js';
import Span from '@atoms/Span.js';
import { Button } from '@atoms/Button.js';
import styled from 'styled-components';
import DropDown from '../organisms/DropDown';

const LabelDropDown = () => {
    const [labels, setLabels] = useState(null);

    useEffect(() => {
        const getLabels = () => {
            fetch('http://49.50.160.103:3000/labels')
                .then((res) => res.json())
                .then((res) => {
                    setLabels(res.data);
                });
        };
        getLabels();
    }, []);
    if (!labels) return <div></div>;

    return (
        <div style={{ border: '1px solid black', height: '100%' }}>
            <DropDown items={labels} subject="Labels" style={{ float: 'right' }}>
                <Span>Labels</Span>
                <Span>None yet </Span>
            </DropDown>
        </div>
    );
};

export default LabelDropDown;
