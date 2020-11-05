import React from 'react';
import SVG from '@atoms/SVG';
import Label from '@atoms/Label';
import Span from '@atoms/Span';
import CheckBox from '@atoms/CheckBox';
import styled from 'styled-components';

const getAuthor = (issue_id, author) => {
    return `#${issue_id} opend ~ days ago by ${author}`;
};

const IssueItemContainer = styled.div`
    display: flex;
    height: 50px;
`;

const IssueItemLeft = styled.div`
    flex: 1;
    display: inline-flex;
    & > * {
        flex: 0.1;
        justify-content: center;
        align-self: center;
    }
`;

const IssueItemRight = styled.div`
    flex: 1;
`;

const IssueItemInfo = styled.div`
    flex: 1;
    flex-direction: column;
`;

const Title = styled.div`
    display: flex;
    align-items: center;
    justify-content: flex-start;
`;

const AuthorAndMilestone = styled.div`
    display: flex;
`;

const IssueItem = (props) => {
    return (
        <IssueItemContainer>
            <IssueItemLeft>
                <CheckBox />
                <SVG height="100%" name="issue-opened" color="#ff0000" />
                <IssueItemInfo>
                    <Title>
                        <Span children={props.title} fontColor="black" fontSize="20px" fontWeight="bold" />
                        <Label name="test" background="#ff00ff" fontSize="13px" />
                    </Title>
                    <AuthorAndMilestone>
                        <Span children={getAuthor(props.issue_id, props.author)} fontColor="grey" fontSize="13px" />
                        <Span children="스프린트2" fontColor="grey" fontSize="13px" />
                    </AuthorAndMilestone>
                </IssueItemInfo>
            </IssueItemLeft>
            <IssueItemRight />
        </IssueItemContainer>
    );
};

export default IssueItem;
