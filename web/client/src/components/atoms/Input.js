import React from 'react';
import styled from 'styled-components';

const PRESENSE = 1.8;
const NONE = 0;

const StyledInput = styled.input`
    outline: none;
    id: ${({ id }) => id};
    width: ${({ width }) => width};
    height: ${({ height }) => height};
    border: ${({ border }) => (border === 'true' ? PRESENSE : NONE)}px solid #cccccc;
    border-radius: 4px;
`;

const Input = ({ id, placeholder, width, height, border }) => {
    return <StyledInput id={id} placeholder={placeholder} width={width} height={height} border={border}></StyledInput>;
};

Input.defaultProps = {
    height: '26px',
    border: 'true',
};

export default Input;
