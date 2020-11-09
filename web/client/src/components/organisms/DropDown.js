import React from 'react';
import DropDownMenu from '../molecules/DropDownMenu';
import styled from 'styled-components';
import Button from '../atoms/Button';
const StyledDropDown = styled.div`
    position: relative;
`;

const Padding = styled.div`
    padding: 0 16px;
`;
const DropDown = ({ subject, isClicked }) => {
    const items = ['아이템1', '아이템2', '아이템3'];

    return (
        <StyledDropDown>
            <Padding>
                <Button backgroundColor="transparent" text={subject} height="auto" width="auto" />
            </Padding>

            {isClicked ? <DropDownMenu items={items} title={subject} /> : null}
        </StyledDropDown>
    );
};

export default DropDown;
