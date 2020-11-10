import React from 'react';
import styled from 'styled-components';

const PRESENSE = 1;
const NONE = 0;
const ROUND = 4;

const StyledButton = styled.button`
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: ${({ backgroundColor }) => backgroundColor};
    color: ${({ fontColor }) => fontColor};
    outline: none;
    border: ${({ border }) => (border === 'true' ? PRESENSE : NONE)}px solid #e1e4e8;
    height: ${({ height }) => height};
    width: ${({ width }) => width};
    border-radius: ${({ radius }) => (radius ? ROUND : NONE)}px;
`;

const Button = ({ backgroundColor, fontColor, border, width, height, radius, onClick, text }) => {
    return (
        <StyledButton
            backgroundColor={backgroundColor}
            fontColor={fontColor}
            border={border}
            width={width}
            height={height}
            radius={radius}
            onClick={onClick}
        >
            {text}
        </StyledButton>
    );
};

Button.defaultProps = {
    width: '90px',
    height: '30px',
    border: 'none',
    fontColor: 'black',
};

export { Button, StyledButton };
