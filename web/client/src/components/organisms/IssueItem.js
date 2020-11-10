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
    console.log(props.issue);
    if (!props.issue) return null;
    return (
        <IssueItemDiv width={props.width} height={props.height}>
            <IssueItemLeft issue={props.issue} />
            <IssueItemRight />
        </IssueItemDiv>
    );
};

IssueItemDiv.defaultProps = {
    width: '100%',
    height: '60px',
};

export default IssueItem;
