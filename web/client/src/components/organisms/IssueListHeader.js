import React from 'react';
import styled from 'styled-components';
import CheckBox from '@atoms/CheckBox';
import DropDownGroup from '@organisms/DropDownGroup';

const StyledIssueListHeader = styled.div`
    border: 1px solid #aaaaaa;
    display: flex;
    justify-content: space-between;
    background-color: #eeeeee;
    padding: 0px;
    font-size: 14px;
    height: 55px;
    box-sizing: border-box;
    height: 100%;
    border-radius: 4px 4px 0px 0px;
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
