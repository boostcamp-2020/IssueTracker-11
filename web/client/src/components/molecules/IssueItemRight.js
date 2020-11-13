import React from 'react';
import styled from 'styled-components';
import ProfileImage from '@atoms/ProfileImage';

const IssueItemRightDiv = styled.div`
    flex: 1;
    display: flex;
`;

const DummyDiv = styled.div`
    flex: 1;
`;

const IssueItemRight = (props) => {
    return (
        <IssueItemRightDiv>
            <DummyDiv></DummyDiv>
            <DummyDiv></DummyDiv>
            <DummyDiv>
                <ProfileImage
                    width="20px"
                    height="20px"
                    src="https://avatars3.githubusercontent.com/u/29480583?s=40&v=4"
                ></ProfileImage>
            </DummyDiv>
            <DummyDiv></DummyDiv>
        </IssueItemRightDiv>
    );
};

export default IssueItemRight;
