import React from 'react';
import styled from 'styled-components';

const StyledDownArrow = styled.span`
    display: inline-block;
    margin-left: 5px;
    border-top: 4px solid black;
    border-right: 4px solid transparent;
    border-bottom: 4px solid transparent;
    border-left: 4px solid transparent;
`;

const DownArrow = () => {
    return <StyledDownArrow />;
};

export default DownArrow;
