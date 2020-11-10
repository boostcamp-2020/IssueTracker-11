import React from 'react';
import styled from 'styled-components';
import ListItem from '@atoms/ListItem';

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
