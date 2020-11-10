import React, { useState } from 'react';
import styled from 'styled-components';
import DropDownMenu from '@molecules/DropDownMenu';
import ButtonWithArrow from '@molecules/ButtonWithArrow';

const StyledDropDown = styled.div`
    position: relative;
    justify-content: center;
    border-radius: 4px 0px 0px 4px;
    height: 100%;
`;

const DropDown = ({ children, backgroundColor, subject, items = ['아이템1', '아이템2', '아이템3'] }) => {
    const title = items.map((el) => el.title || el.name || el.email);
    const [IsClicked, setIsClicked] = useState(false);
    const buttonEvent = () => {
        console.log('클릭됨!');
        setIsClicked(!IsClicked);
    };
    return (
        <StyledDropDown>
            <ButtonWithArrow backgroundColor={backgroundColor} text={subject} onClick={buttonEvent}></ButtonWithArrow>
            {IsClicked ? <DropDownMenu items={title} title={subject} /> : null}
            {children}
        </StyledDropDown>
    );
};

export default DropDown;
