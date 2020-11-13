import React, { useState } from 'react';
import IssueSection from '@templates/IssueSection.js';
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
