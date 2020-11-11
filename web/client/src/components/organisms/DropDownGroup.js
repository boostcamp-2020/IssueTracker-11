import React from 'react';
import styled from 'styled-components';
import AssigneeDropDown from '@organisms/AssigneeDropDown.js';
import LabelDropDown from '@organisms/LabelDropDown.js';
import MilestoneDropDown from '@organisms/MilestoneDropDown.js';
import AuthorDropDown from '@organisms/AssigneeDropDown.js';

const StyledDropDownGroup = styled.ul`
    height: 100%;
    & {
        display: flex;
        justify-content: space-evenly;
        margin: 0;
        padding: 0;
    }
`;

const DropDownGroup = () => {
    return (
        <StyledDropDownGroup>
            <AuthorDropDown></AuthorDropDown>
            <LabelDropDown></LabelDropDown>
            <MilestoneDropDown></MilestoneDropDown>
            <AssigneeDropDown></AssigneeDropDown>
        </StyledDropDownGroup>
    );
};

export default DropDownGroup;
