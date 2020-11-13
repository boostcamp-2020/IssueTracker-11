import React, { useContext } from 'react';
import styled from 'styled-components';
import { DropDownContext } from '@organisms/DropDown.js';
import Circle from '@atoms/Circle';
import { AppContext } from '../../App';
import { CheckboxContext } from '../../store/CheckboxStore';

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
    const { checkState } = useContext(CheckboxContext);
    const markAsEvent = (item) => {
        let status = undefined;
        if (item === 'open') status = 1;
        else status = 0;

        const changeStatus = async () => {
            const res = await fetch(`http://49.50.160.103:3000/issues/${status}`, {
                method: 'PATCH',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(checkState.ids),
            });
        };
        changeStatus();
    };
    const onClickMethod = item === 'open' || item === 'closed' ? () => markAsEvent(item) : () => onSelectData(item);
    return (
        <StyledListItem onClick={onClickMethod}>
            {item.name ? <Circle height="10px" color={item.color} /> : null}
            {item.title || item.name || item.email || item}
        </StyledListItem>
    );
};

export default ListItem;
