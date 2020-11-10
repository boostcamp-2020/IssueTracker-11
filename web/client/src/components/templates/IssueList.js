import React, { useState, useEffect } from 'react';
import styled from 'styled-components';

import IssueListHeader from '@organisms/IssueListHeader.js';
import IssueItem from '@organisms/IssueItem.js';

const StyledIssueList = styled.div``;

const IssueList = () => {
    const [issues, setIssues] = useState(null);
    useEffect(() => {
        const fetchIssues = async () => {
            try {
                const res = await fetch('http://49.50.160.103:3000/issues').then((res) => res.json());
                setIssues(res.data);
            } catch (err) {
                console.log('err >>>> ', err);
            }
        };
        fetchIssues();
    }, []);
    if (!issues) return null;
    return (
        <StyledIssueList>
            <IssueListHeader></IssueListHeader>
            {issues.map((issue) => (
                <IssueItem key={issue.issue_id} issue={issue} />
            ))}
        </StyledIssueList>
    );
};

export default IssueList;
