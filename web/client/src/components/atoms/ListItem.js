import React from 'react';
import styled from 'styled-components';
const StyledListItem = styled.li`
    border-top: 1px solid #eeeeee;
    padding: 5px 30px;
    list-style: none;
`;
const ListItem = ({ item }) => {
    return <StyledListItem>{item}</StyledListItem>;
};

export default ListItem;
