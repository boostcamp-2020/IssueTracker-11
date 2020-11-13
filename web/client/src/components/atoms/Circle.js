import React from 'react';
import styled from 'styled-components';

const StyledCircle = styled.div`
    border-radius: 50%;
    background-color: ${({ color }) => color};
    overflow: hidden;
    width: ${({ height }) => height};
    height: ${({ height }) => height};
    margin-right: 15px;
`;

const Circle = ({ height, color }) => {
    return <StyledCircle height={height} color={color}></StyledCircle>;
};

export default Circle;
