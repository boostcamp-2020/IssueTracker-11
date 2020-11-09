import React from 'react';
import styled from 'styled-components';
import IssueItemRight from '@molecules/IssueItemRight';
import IssueItemLeft from '@molecules/IssueItemLeft';

const IssueItemDiv = styled.div`
    display: flex;
    width: ${(props) => props.width};
    height: ${(props) => props.height};
    border: 1px solid black;
`;

const IssueItem = (props) => {
    return (
        <IssueItemDiv width={props.width} height={props.height}>
            <IssueItemLeft issue_id={props.issue_id} author={props.author} />
            <IssueItemRight />
        </IssueItemDiv>
    );
};

export default IssueItem;
