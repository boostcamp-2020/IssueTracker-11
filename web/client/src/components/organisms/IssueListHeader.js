import React from 'react';
import styled from 'styled-components';
import CheckBox from '@atoms/CheckBox';
import DropDownGroup from '@organisms/DropDownGroup';

const StyledIssueListHeader = styled.div`
    border: 1px solid black;
    display: flex;
    justify-content: space-between;
    padding: 16px;
    font-size: 14px;
    height: 55px;
    box-sizing: border-box;
`;
const IssuListHeader = () => {
    return (
        <StyledIssueListHeader>
            <CheckBox />
            <DropDownGroup />
        </StyledIssueListHeader>
    );
};

export default IssuListHeader;
