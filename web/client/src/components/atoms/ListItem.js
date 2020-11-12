import React, { useContext } from 'react';
import styled from 'styled-components';
import { DropDownContext } from '@organisms/DropDown.js';
import Circle from '@atoms/Circle';
import { AppContext } from '../../App';

const StyledListItem = styled.li`
    border-top: 1px solid gray;
    padding: 5px 30px;
    width: 100%;
    list-style: none;
    display: flex;
    align-items: center;
`;

const ListItem = ({ item }) => {
    const { onSelectData } = useContext(AppContext);
    const onClickMethod = () => onSelectData(item);
    return (
        <StyledListItem onClick={onClickMethod}>
            {item.name ? <Circle height="10px" color={item.color} /> : null}
            {item.title || item.name || item.email}
        </StyledListItem>
    );
};

export default ListItem;
