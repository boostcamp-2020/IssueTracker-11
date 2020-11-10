import React from 'react';
import styled from 'styled-components';

const PRESENSE = 1.8;
const NONE = 0;
const ROUND = 4;

const StyledButton = styled.button`
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: ${({ backgroundColor }) => backgroundColor};
    font-weight: ${({ fontWeight }) => fontWeight === 'bold' && 'bold'};
    color: ${({ fontColor }) => fontColor};
    outline: none;
    border: ${({ border }) => (border === 'true' ? PRESENSE : NONE)}px solid #e1e4e8;
    height: ${({ height }) => height};
    width: ${({ width }) => width};
    border-radius: ${({ radius }) => (radius ? ROUND : NONE)}px;
    margin-top: ${({ marginTop }) => marginTop};
    margin-bottom: ${({ marginBottom }) => marginBottom};
    margin-left: ${({ marginLeft }) => marginLeft};
    margin-right: ${({ marginRight }) => marginRight};
`;

const Button = ({
    children,
    backgroundColor,
    fontColor,
    fontWeight,
    border,
    width,
    height,
    radius,
    text,
    onClick,
    marginBottom,
    marginLeft,
    marginRight,
    marginTop,
}) => {
    return (
        <StyledButton
            backgroundColor={backgroundColor}
            fontColor={fontColor}
            border={border}
            fontWeight={fontWeight}
            width={width}
            height={height}
            radius={radius}
            onClick={onClick}
            marginTop={marginTop}
            marginBottom={marginBottom}
            marginRight={marginRight}
            marginLeft={marginLeft}
        >
            {text}
            {children}
        </StyledButton>
    );
};

Button.defaultProps = {
    width: '90px',
    height: '37px',
    border: 'none',
    fontColor: 'black',
    backgroundColor: 'red',
};

export { Button, StyledButton };
