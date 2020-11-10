import React from 'react';
import styled from 'styled-components';

const StyledButton = styled.button``;

const SubmitButton = ({ onClick, text }) => {
    return <StyledButton onClick={onClick}>{text}</StyledButton>;
};

SubmitButton.defaultProps = {};

export default SubmitButton;
