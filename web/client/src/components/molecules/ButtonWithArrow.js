import React from 'react';
import styled from 'styled-components';
import DownArrow from '@atoms/DownArrow';
import { StyledButton } from '@atoms/Button';

const StyledButtonWithArrow = styled(StyledButton)`
    padding: 0 16px;
    height: 36px;
    backgroundcolor: ${({ backgroundColor }) => backgroundColor};
`;

const ButtonWithArrow = ({ backgroundColor, text }) => {
    return (
        <StyledButtonWithArrow backgroundColor={backgroundColor}>
            {text}
            <DownArrow />
        </StyledButtonWithArrow>
    );
};

export default ButtonWithArrow;
