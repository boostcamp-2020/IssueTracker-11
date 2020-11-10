import React from 'react';
import styled from 'styled-components';
import { StyledButton } from '@atoms/Button';
import DropDownMenu from '@molecules/DropDownMenu';
import ButtonWithArrow from '@molecules/ButtonWithArrow';
const StyledDropDown = styled.div`
    position: relative;
`;

const DropDown = ({ subject, isClicked }) => {
    const items = ['아이템1', '아이템2', '아이템3'];

    return (
        <StyledDropDown>
            <ButtonWithArrow text={subject}></ButtonWithArrow>
            {isClicked ? <DropDownMenu items={items} title={subject} /> : null}
        </StyledDropDown>
    );
};

export default DropDown;
