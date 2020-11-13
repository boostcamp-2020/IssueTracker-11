import React from 'react';
import styled from 'styled-components';
import DownArrow from '@atoms/DownArrow';
import { StyledButton } from '@atoms/Button';

const StyledButtonWithArrow = styled(StyledButton)`
    padding: 0 16px;
    height: inherit;
    line-height: ${({ lineHeight }) => (lineHeight ? lineHeight : 0)};
    backgroundcolor: ${({ backgroundColor }) => backgroundColor};
`;

const ButtonWithArrow = ({ backgroundColor, text, lineHeight, onClick }) => {
    return (
        <StyledButtonWithArrow backgroundColor={backgroundColor} lineHeight={lineHeight} onClick={onClick}>
            {text}
            <DownArrow />
        </StyledButtonWithArrow>
    );
};

export default ButtonWithArrow;
