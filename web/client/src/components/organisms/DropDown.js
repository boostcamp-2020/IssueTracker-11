import React from 'react';
import styled from 'styled-components';
import DropDownMenu from '@molecules/DropDownMenu';
import ButtonWithArrow from '@molecules/ButtonWithArrow';

const StyledDropDown = styled.div`
    position: relative;
    justify-content: center;
    border-radius: 4px 0px 0px 4px;
    overflow: scroll;
`;

const DropDown = ({ backgroundColor, subject, isClicked, items = ['아이템1', '아이템2', '아이템3'] }) => {
    const title = items?.map((el) => el.title) || items?.map((el) => el.name);

    return (
        <StyledDropDown>
            <ButtonWithArrow backgroundColor={backgroundColor} text={subject}></ButtonWithArrow>
            {isClicked ? <DropDownMenu items={title} title={subject} /> : null}
        </StyledDropDown>
    );
};

export default DropDown;
