import React from 'react';
import styled from 'styled-components';

const PRESENSE = 1;
const NONE = 0;

const StyledInput = styled.input`
    width: ${({ width }) => width};
    height: ${({ height }) => height};
    border: ${({ border }) => (border === 'true' ? PRESENSE : NONE)}px solid #e1e4e8;
`;

const Input = ({ placeholder, width, height, border }) => {
    return <StyledInput placeholder={placeholder} width={width} height={height} border={border}></StyledInput>;
};

Input.defaultProps = {
    height: '26px',
    border: 'true',
};

export default Input;
