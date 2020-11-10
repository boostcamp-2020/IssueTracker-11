import React from 'react';
import styled from 'styled-components';
import IssueItemRight from '@molecules/IssueItemRight';
import IssueItemLeft from '@molecules/IssueItemLeft';

const IssueItemDiv = styled.div`
    display: flex;
    width: ${(props) => props.width};
    height: ${(props) => props.height};
    border-right: 1px solid #aaaaaa;
    border-bottom: 1px solid #aaaaaa;
    border-left: 1px solid #aaaaaa;
`;

const IssueItem = (props) => {
    return (
        <IssueItemDiv width={props.width} height={props.height}>
            <IssueItemLeft issue_id={props.issue_id} author={props.author} />
            <IssueItemRight />
        </IssueItemDiv>
    );
};

IssueItemDiv.defaultProps = {
    width: '100%',
    height: '60px',
};

export default IssueItem;
