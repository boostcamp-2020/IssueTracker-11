import React, { useContext } from 'react';
import styled from 'styled-components';
import { DropDownContext } from '@organisms/DropDown.js';

const StyledListItem = styled.li`
    border-top: 1px solid gray;
    padding: 5px 30px;
    width: 100%;
    list-style: none;
`;

const ListItem = ({ item }) => {
    const onSelect = useContext(DropDownContext);
    const onClickMethod = () => {
        onSelect(item);
    };
    return <StyledListItem onClick={onClickMethod}>{item.title || item.name || item.email}</StyledListItem>;
};

export default ListItem;
