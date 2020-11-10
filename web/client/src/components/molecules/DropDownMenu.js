import React from 'react';
import styled from 'styled-components';
import P from '@atoms/P';
import DropDownList from '@molecules/ListGroup';

const StyledDropDownMenu = styled.div`
    position: absolute;
    z-index: 1000;
    width: 300px;
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
