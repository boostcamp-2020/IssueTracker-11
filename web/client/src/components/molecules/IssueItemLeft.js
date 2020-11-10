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

const IssueItemLeft = (props) => {
    return (
        <IssueItemLeftDiv>
            {/* Check Box */}
            <Padding padding="5px 5px 0px 2px">
                <CheckBox />
            </Padding>

            {/* Issue-Opened SVG */}
            <Padding padding="8px 5px 0px 2px">
                <SVG name="issue-opened" height="20px" color="#ff2200" fillRule="evenodd"></SVG>
            </Padding>

            {/* Issue */}
            <IssueItemInfo issue_id={props.issue_id} author={props.author} />
        </IssueItemLeftDiv>
    );
};

export default IssueItemLeft;
