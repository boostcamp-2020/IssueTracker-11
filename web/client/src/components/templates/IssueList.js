import React, { useState, useEffect, useContext } from 'react';
import styled from 'styled-components';
import IssueListHeader from '@organisms/IssueListHeader.js';
import IssueItem from '@organisms/IssueItem.js';
import { IssueContext } from '../../store/IssueStore';

const StyledIssueList = styled.div``;

const IssueList = () => {
    const { issues, issueDispatch } = useContext(IssueContext);
    if (!Object.keys(issues).length) return null;
    return (
        <StyledIssueList>
            <IssueListHeader></IssueListHeader>
            {issues.data.map((issue) => (
                <IssueItem key={issue.issue_id} issue={issue} />
            ))}
        </StyledIssueList>
    );
};

export default IssueList;
