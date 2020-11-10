import React, { useState, useEffect } from 'react';
import styled from 'styled-components';
import { Button } from '../atoms/Button';
import SubmitButton from '@atoms/SubmitButton';
import Input from '../atoms/Input';
import Span from '../atoms/Span';
import IssueSection from '@templates/IssueSection.js';
import DropDown from '../organisms/DropDown';
import IssueAside from '@templates/IssueAside.js';

const IssueNote = () => {
    return (
        <div style={{ border: '1px solid black', display: 'inline-block', width: '100%', height: '500px' }}>
            <IssueSection></IssueSection>
            <IssueAside></IssueAside>
        </div>
    );
};

export default IssueNote;
