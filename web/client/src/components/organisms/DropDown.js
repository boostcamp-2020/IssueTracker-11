import React, { useState } from 'react';
import styled from 'styled-components';
import DropDownMenu from '@molecules/DropDownMenu';
import ButtonWithArrow from '@molecules/ButtonWithArrow';

const StyledDropDown = styled.div`
    position: relative;
    justify-content: center;
    border-radius: 4px 0px 0px 4px;
    height: inherit;
`;

export const DropDownContext = React.createContext();

const DropDown = ({ children, backgroundColor, subject, items = ['아이템1', '아이템2', '아이템3'], lineHeight }) => {
    const [IsClicked, setIsClicked] = useState(false);
    const [Selected, setSelected] = useState([]);

    const onSelect = (newThing) => {
        setSelected([...Selected, newThing]);
        console.log(Selected);
    };

    const buttonEvent = () => {
        setIsClicked(!IsClicked);
    };

    return (
        <DropDownContext.Provider value={onSelect}>
            <StyledDropDown>
                <ButtonWithArrow
                    backgroundColor={backgroundColor}
                    text={subject}
                    onClick={buttonEvent}
                    lineHeight={lineHeight}
                ></ButtonWithArrow>
                {IsClicked ? <DropDownMenu items={items} title={subject} /> : null}
                {children}
            </StyledDropDown>
        </DropDownContext.Provider>
    );
};

export default DropDown;
