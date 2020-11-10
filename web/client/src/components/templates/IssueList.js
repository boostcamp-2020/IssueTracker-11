import React from 'react';
import styled from 'styled-components';

import IssueListHeader from '@organisms/IssueListHeader.js';
import IssueItem from '@organisms/IssueItem.js';

const StyledIssueList = styled.div``;

const IssueList = () => {
    return (
        <StyledIssueList>
            <IssueListHeader></IssueListHeader>
            <IssueItem></IssueItem>
            <IssueItem></IssueItem>
            <IssueItem></IssueItem>
            <IssueItem></IssueItem>
            <IssueItem></IssueItem>
        </StyledIssueList>
    );
};

export default IssueList;
