import React from 'react';
import styled from 'styled-components';
import DownArrow from '@atoms/DownArrow';
import { StyledButton } from '@atoms/Button';

const StyledButtonWithArrow = styled(StyledButton)`
    padding: 0 16px;
`;

const ButtonWithArrow = ({ text }) => {
    return (
        <StyledButtonWithArrow>
            {text}
            <DownArrow />
        </StyledButtonWithArrow>
    );
};

export default ButtonWithArrow;
