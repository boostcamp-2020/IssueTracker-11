import React from 'react';
import ListItem from '../atoms/ListItem';
import styled from 'styled-components';

const StyledTitle = styled.p`
    margin: 0;
    padding: 5px 10px;
    font-size: 14px;
    background-color: #eeeeee;
`;
const StyledListGroup = styled.ul`
    border: 1px solid #eeeeee;
    border-radius: 4px;
    width: 200px;
    text-align: left;
`;

const ListGroup = ({ items }) => {
    return (
        <StyledListGroup>
            {items.map((item) => (
                <ListItem item={item} />
            ))}
        </StyledListGroup>
    );
};

export default ListGroup;
