import React from 'react';
import DropDownMenu from '../molecules/DropDownMenu';
import styled from 'styled-components';
import { StyledButton } from '../atoms/Button';

const StyledDropDown = styled.div`
    position: relative;
`;

const DropDownButton = styled(StyledButton)`
    padding: 0 16px;
`;
const DropDown = ({ subject, isClicked }) => {
    const items = ['아이템1', '아이템2', '아이템3'];

    return (
        <StyledDropDown>
            <DropDownButton backgroundColor="transparent" text={subject} height="auto" width="auto">
                {subject}
            </DropDownButton>
            {isClicked ? <DropDownMenu items={items} title={subject} /> : null}
        </StyledDropDown>
    );
};

export default DropDown;
