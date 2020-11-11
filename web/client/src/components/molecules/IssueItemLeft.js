import React from 'react';
import styled from 'styled-components';
import Padding from '@atoms/Padding';
import CheckBox from '@atoms/CheckBox';
import SVG from '@atoms/SVG';
import IssueItemInfo from '@molecules/IssueItemInfo';

const IssueItemLeftDiv = styled.div`
    display: flex;
    flex: 1;
`;

const IssueItemLeft = ({ issue }) => {
    return (
        <IssueItemLeftDiv>
            {/* Check Box */}
            <Padding padding="5px 5px 0px 16px">
                <CheckBox issueId={issue.issue_id} />
            </Padding>

            {/* Issue-Opened SVG */}
            <Padding padding="8px 5px 0px 2px">
                {issue.status ? (
                    <SVG name="issue-opened" height="20px" fillRule="evenodd" color="green"></SVG>
                ) : (
                    <SVG name="issue-closed" height="20px" color="#ff2200" fillRule="evenodd"></SVG>
                )}
            </Padding>

            {/* Issue */}
            <IssueItemInfo issue={issue} />
        </IssueItemLeftDiv>
    );
};

export default IssueItemLeft;
