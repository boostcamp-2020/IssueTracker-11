import React from 'react';
import styled from 'styled-components';
import P from '../atoms/P';
import DropDownList from './ListGroup';

const StyledDropDownMenu = styled.div`
    position: absolute;
`;
const DropDownMenu = ({ title, items }) => {
    return (
        <StyledDropDownMenu>
            <P content={title}></P>
            <DropDownList items={items}></DropDownList>
        </StyledDropDownMenu>
    );
};

export default DropDownMenu;
