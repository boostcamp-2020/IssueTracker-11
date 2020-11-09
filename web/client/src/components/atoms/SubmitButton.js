import React from 'react';
import styled from 'styled-components';

const StyledButton = styled.button`
    onclick: ${({ onClick }) => onClick};
`;

const Button = ({ onClick, text }) => {
    return <StyledButton onClick={onClick}>{text}</StyledButton>;
};

Button.defaultProps = {};

export default Button;
