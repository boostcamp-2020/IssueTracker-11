import React from 'react';
import styled from 'styled-components';
import Padding from '@atoms/Padding';
import Span from '@atoms/Span';
import Label from '@atoms/Label';
import SVG from '@atoms/SVG';

const generateAuthorText = (issue_id, author) => {
    return `#${issue_id} opend ~ days ago by ${author}`;
};

const IssueItemInfoDiv = styled.div`
    display: flex;
    flex-direction: column;
    justify-content: space-around;
`;

const TitleAndLabel = styled.div`
    display: flex;
    align-items: center;
`;

const AuthorAndMilestone = styled.div`
    display: flex;
`;

const IssueItemInfo = (props) => {
    return (
        <IssueItemInfoDiv>
            <TitleAndLabel>
                {/* Issue Title */}
                <Padding padding="0px 5px 0px 0px">
                    <Span children="span_content" color="#ffffff" fontSize="16px" fontWeight="bold"></Span>
                </Padding>

                {/* Label */}
                <Label name="label_name" fontSize="12px" background="#ffff00"></Label>
            </TitleAndLabel>
            <AuthorAndMilestone>
                {/* Author */}
                <Padding padding="0px 5px 0px 0px">
                    <Span
                        children={generateAuthorText(props.issue_id, props.author)}
                        fontColor="#808080"
                        fontSize="12px"
                    ></Span>
                </Padding>

                {/* Milestone SVG */}
                <Padding padding="0px 5px 0px 10px">
                    <SVG name="milestone" height="13px" color="#808080" fillRule="evenodd"></SVG>
                </Padding>

                {/* Milestone Content */}
                <Padding padding="0px 5px 0px 0px">
                    <Span children="span_content" fontColor="#808080" fontSize="12px"></Span>
                </Padding>
            </AuthorAndMilestone>
        </IssueItemInfoDiv>
    );
};

export default IssueItemInfo;
