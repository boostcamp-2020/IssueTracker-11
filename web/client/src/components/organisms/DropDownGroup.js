import React from 'react';
import DropDown from './DropDown';
import styled from 'styled-components';
const StyledDropDownGroup = styled.ul`
    & {
        border: 1px solid red;
        display: flex;
        justify-content: space-evenly;
        margin: 0;
        padding: 0;
    }
`;
const dropDowns = [
    {
        subject: 'Author',
        isClicked: true,
    },
    { subject: 'Label', isClicked: false },
    { subject: 'Milestones', isClicked: false },
    { subject: 'Assignee', isClicked: false },
];
const DropDownGroup = () => {
    return (
        <StyledDropDownGroup>
            {dropDowns.map((dropDown) => (
                <DropDown subject={dropDown.subject} isClicked={dropDown.isClicked} />
            ))}
        </StyledDropDownGroup>
    );
};

export default DropDownGroup;
