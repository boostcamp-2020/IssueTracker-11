import React from 'react';
import styled from 'styled-components';

const StyledP = styled.p`
    margin: 0;
    padding: 5px 10px;
    font-size: 14px;
    background-color: #eeeeee;
`;

const P = ({ content }) => {
    return <StyledP>{content}</StyledP>;
};

export default P;
