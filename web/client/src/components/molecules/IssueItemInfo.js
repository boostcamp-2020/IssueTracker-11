import React from 'react';
import styled from 'styled-components';
import Padding from '@atoms/Padding';
import Span from '@atoms/Span';
import Label from '@atoms/Label';
import SVG from '@atoms/SVG';

const generateAuthorText = (issue_id, author, status, createdAt) => {
    return `#${issue_id} ${status ? 'opend' : 'closed'} ${getTimeDiff(createdAt)} ago by ${author}`;
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

const IssueItemInfo = ({ issue }) => {
    return (
        <IssueItemInfoDiv>
            <TitleAndLabel>
                {/* Issue Title */}
                <Padding padding="0px 5px 0px 0px">
                    <Span children={issue.title} color="#ffffff" fontSize="16px" fontWeight="bold"></Span>
                </Padding>

                {/* Label */}
                {issue.labels.map((label) => (
                    <Label name={label.name} fontSize="12px" background="#ffff00" />
                ))}
            </TitleAndLabel>
            <AuthorAndMilestone>
                {/* Author */}
                <Padding padding="0px 5px 0px 0px">
                    <Span
                        children={generateAuthorText(
                            issue.issue_id,
                            issue.author.nickname,
                            issue.status,
                            issue.created_at,
                        )}
                        fontColor="#808080"
                        fontSize="12px"
                    ></Span>
                </Padding>
                {issue.milestone ? (
                    <div style={{ display: 'flex' }}>
                        <Padding padding="0px 5px 0px 10px">
                            <SVG name="milestone" height="13px" color="#808080" fillRule="evenodd"></SVG>
                        </Padding>
                        <Padding padding="0px 5px 0px 0px">
                            <Span children={issue.milestone.title} fontColor="#808080" fontSize="12px"></Span>
                        </Padding>
                    </div>
                ) : null}
            </AuthorAndMilestone>
        </IssueItemInfoDiv>
    );
};

export default IssueItemInfo;
