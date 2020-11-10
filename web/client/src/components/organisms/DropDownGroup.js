import React from 'react';
import styled from 'styled-components';
import DropDown from '@organisms/DropDown';
const StyledDropDownGroup = styled.ul`
    height: 100%;
    & {
        display: flex;
        justify-content: space-evenly;
        margin: 0;
        padding: 0;
    }
`;

const dropDowns = [
    { subject: 'Author', isClicked: false },
    { subject: 'Label', isClicked: false },
    { subject: 'Milestones', isClicked: false },
    { subject: 'Assignee', isClicked: false },
];

const DropDownGroup = () => {
    return (
        <StyledDropDownGroup>
            {dropDowns.map((dropDown) => (
                <div style={{ height: '100%' }}>
                    <DropDown backgroundColor="#eeeeee" subject={dropDown.subject} isClicked={dropDown.isClicked} />
                </div>
            ))}
        </StyledDropDownGroup>
    );
};

export default DropDownGroup;
